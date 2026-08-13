//
//  VerifyPhoneView.swift
//  Livio
//
//  Created by Toluwalase on 08/08/2026.
//

import SwiftUI

struct VerifyPhoneView: View {
    
    @State private var otpCode = ""
    @State private var navigateToAlmostThereView = false
    
    @State private var isOn = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading){
                HeadingText("Enter Code ")
                    .padding(.bottom, 8)
                RegularText("Enter the 6 digit code sent to your email")
                    .lineHeight(.leading(increase: 8))
                
                
                OTPInputView(code: $otpCode,length: 6){
                    code in
                    
                    print("OTP entererd \(code)")
                    
                    verifyOTP(code)
                }
                
                HStack( spacing: 4) {
                    RegularText("Try again after")
                    
                    RegularText("05:32",color: .gray950)
                }
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 12)
                .padding(.bottom, 40)
                
                Button{
                    navigateToAlmostThereView = true
                } label: {
                    PrimaryButton(
                        title: "Next", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton
                    )
                }.navigationDestination(isPresented: $navigateToAlmostThereView){
                    AlmostThereView()
                        .navigationBarBackButtonHidden()
                }
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                .padding(.top, 40)
                .padding(.horizontal, 20)
                .background(.gray50)
        }
            
            
    }
    
    private func verifyOTP(_ code:String){
        // Simple check: navigate when 6-digit code is entered
        if code.count == 6 {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            navigateToAlmostThereView = true
        }
    }
}

#Preview {
    VerifyPhoneView()
}

