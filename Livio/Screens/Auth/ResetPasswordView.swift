//
//  ResetPasswordView.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var password = ""
    @State private var confrimPassword = ""
    
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    
    @State private var navigateToPasswordChnaged = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    HeadingText("Reset your password")
                        .padding(.bottom, 8)
                    RegularText("Please use a password you can remember")
                        .lineHeight(.leading(increase: 8))
                    
                }
                .padding(.bottom, 24)
                
                
                
                //                password
                VStack(alignment: .leading,) {
                    TextFieldText("Password")
                    passwordField(
                        text: $password,
                        placeHolder: "**********",
                        isVisible: $showPassword
                    )
                }
                
                //                confirm password
                VStack(alignment: .leading, spacing: 12) {
                    TextFieldText("Confirm Password")
                    passwordField(
                        text: $confrimPassword,
                        placeHolder: "**********",
                        isVisible: $showConfirmPassword
                    )
                }.padding(.bottom, 40)
                
                Button{
                    navigateToPasswordChnaged = true
                } label: {
                    PrimaryButton(title: "Reset password", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroudColor: .primaryButton)
                }.navigationDestination(isPresented: $navigateToPasswordChnaged){
                    PasswordChangedView()
                        .navigationBarBackButtonHidden()
                }
                
                Spacer()
                
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        
        
    }
}

#Preview {
    ResetPasswordView()
}


@ViewBuilder
private func passwordField(
    text: Binding<String>,
    placeHolder: String,
    isVisible: Binding<Bool>,
    hasError: Bool = false
)->some View{
    HStack{
        if isVisible.wrappedValue{
            TextField(placeHolder, text: text)
        }else{
            SecureField(placeHolder, text: text)
        }
        Button{
            isVisible.wrappedValue.toggle()
        }label: {
            Image(systemName: isVisible.wrappedValue ? "eye.slash":"eye")
                .font(.system(size: 20))
                .foregroundStyle(.gray500)
        }
    }
    .font(.system(size: 14))
    .padding(.all, 12)
    .overlay(
        RoundedRectangle(cornerRadius: 12)
            .stroke(
                hasError
                ?
                Color.error600
                :
                Color.gray.opacity(0.3)
            )
    )
    .padding(.bottom, 12)
}
