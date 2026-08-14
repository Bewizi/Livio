//
//  SendResetLink.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct SendResetLinkView: View {
    @State private var otpCode = ""
    @State private var navigateToResetPasswordView = false
    
    @State private var isOn = false
    
    var body: some View {
            VStack{
                VStack(alignment:.leading){
                    HeadingText("Please check your email")
                        .padding(.bottom, 8)
                    RegularText("Enter the 6 digit code sent to youremail@gmail.com")
                        .lineHeight(.leading(increase: 8))
                    
                    
                    OTPInputView(code: $otpCode,length: 6){
                        code in
                        
                        print("OTP entererd \(code)")
                        
                        verifyOTP(code)
                    }.padding(.bottom, 16)
                    
                    HStack( spacing: 4) {
                        RegularText("Try again after")
                        
                        RegularText("05:32",color: .gray950)
                    }
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 12)
                    .padding(.bottom, 40)
                    
                    Button{
                        navigateToResetPasswordView = true
                    } label: {
                        PrimaryButton(
                            title: "Verify", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton
                        )
                    }.navigationDestination(isPresented: $navigateToResetPasswordView){
                        ResetPasswordView()
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
            navigateToResetPasswordView = true
        }
    }
}

#Preview {
    SendResetLinkView()
}
