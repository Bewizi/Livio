//
//  OTPInputView.swift
//  Livio
//
//  Created by Toluwalase on 08/08/2026.
//

import SwiftUI



struct OTPInputView: View {
    
    let length: Int
    let onComplete: (String)->Void
    
    @Binding private var code: String
    @FocusState private var isFocused: Bool
    
    @State private var isError: Bool = false
    
    init(code: Binding<String>,
         length: Int = 6,
    onComplete: @escaping (String) -> Void = {_ in}
    ) {
        self._code = code
        self.length = length
        self.onComplete = onComplete
    }
    
    var body: some View {
        ZStack{
            TextField("", text: $code)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isFocused)
                .frame(width: 1, height: 1)
//                .onChange(of: code) {
//                    handleCodeChanged(code)
//                }
        }
        
        HStack(spacing: 8){
            ForEach(0..<length, id: \.self){
                index in
                OTPBox(character: character(at: index),
                       isActive: isFocused && currentIndex == index,
                       isError: isError
                )
            }
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isError = false
            isFocused = false
        }
        .accessibilityElement(children: .ignore)
            .accessibilityLabel("One-time password")
            .accessibilityValue(code.isEmpty ? "Empty":"\(code.count) of \(length) digits")
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    isFocused = true
                }
            }
    }
    
    private var currentIndex: Int {
        min(code.count, length - 1)
    }
    
    
    private func character(at index: Int) -> String{
        guard index < code.count else{
            return ""
        }
        
        let characters = Array(code)
        return String(characters[index])
    }
    
    private func handleCodeChanged(_ newValue: String){
        let numberOnly = newValue.filter{$0.isNumber}
        
        let limitedCode = String(numberOnly.prefix(length))
        
        if limitedCode != code {
            code = limitedCode
        }
        
        if limitedCode.count == length {
            isFocused = false
            onComplete(limitedCode)
        }
    }
    
    func setError(_ error:Bool) -> some View {
        let view = self
        view.isError = error
        return view
    }
}

private struct OTPBox : View {
    let character: String
    let isActive: Bool
    let isError: Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(borderColor, lineWidth: borderWidth)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white)
                )
            
            Text(character)
                .font(
                    .system(size: 18, weight: .medium),
                ).foregroundStyle(.primary)
        }
        .frame(width: 50, height: 56)
        .padding(.horizontal, 2)
        .animation(.easeInOut(duration: 0.15), value: isActive)
        
    }
    
    private var borderColor: Color {
         if isError {
             return .red
         }
         
         if isActive {
             return .gray950
         }
         
        return .gray300
     }
     
     private var borderWidth: CGFloat {
         if isActive || isError {
             return 1.2
         }
         
         return 1
     }
 
}

