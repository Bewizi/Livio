//
//  OTPTextField.swift
//  Livio
//
//  Created by Toluwalase on 25/08/2026.
//

import SwiftUI

struct OTPTextField: View {
    
    let numberOfFields: Int
    
    @State var enterValue: [String]
    @FocusState private var textFieldFocus: Int?
    @State private var oldValue = ""
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 12){
            ForEach(0..<numberOfFields, id: \.self){
                index in
                TextField("", text: $enterValue[index], onEditingChanged: {
                    editing in
                    
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                    .keyboardType(.numberPad)
                    .frame(width: 50, height: 56, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray950)
                    )
                    .multilineTextAlignment(.center)
                    .focused($textFieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) {_, newValue in
                        if enterValue[index].count > 1 {
                            
                            let currentValue = Array(enterValue[index])
                            
                            if currentValue[0] == Character(oldValue){
                                enterValue[index] = String(enterValue[index].suffix(1))
                            }else{
                                
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        
                        
                        if !newValue.isEmpty{
                            if index == numberOfFields - 1 {
                                textFieldFocus = nil
                            }else{
                                textFieldFocus = (textFieldFocus ?? 0) + 1
                            }
                        }else{
                            textFieldFocus = (textFieldFocus ?? 0) - 1
                        }
                    }
            }
        }
    }
}

#Preview {
    OTPTextField(numberOfFields: 6)
}
