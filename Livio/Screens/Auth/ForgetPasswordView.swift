//
//  ForgetPasswordView.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    
    @State private var email = ""
    
    
    
    @FocusState private var emailFieldIsFocused: Bool
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HeadingText("Forgot password?")
                    .padding(.bottom, 8)
                RegularText("No worries, it happens. Enter your registered email address and we'll send you instructions to reset your password.")
                    .lineHeight(.leading(increase: 8))
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    TextFieldText("Email")
                        .padding(.bottom, 12)
                        .frame(height: 12)
                    
                    TextField(
                        "Enter your email address",
                        text: $email
                    )
                    .focused($emailFieldIsFocused)
                    .onSubmit {
                        if email.isEmpty{
                            
                        }
                        
                        if !email.contains("@"){
                            
                        }
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color(.systemBackground))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.gray300)
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12 ,style: .continuous))
                    
                }
                .padding(.bottom, 24)
                
                NavigationLink{
                    SendResetLinkView().navigationBarBackButtonHidden()
                }label: {
                    PrimaryButton(title: "Send Code", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroudColor: .goldenrod500)
                }.padding(.bottom, 8)
                Spacer()
            }.padding(.horizontal, 20,)
                .padding(.top, 40)
        }
    }
}

#Preview {
    ForgetPasswordView()
}
