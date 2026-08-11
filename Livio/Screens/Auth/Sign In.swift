//
//  Sign In.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct SignInView: View {
    
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var confrimPassword = ""
    
    @State private var selectedFlag: String = "🇳🇬"
    @State private var selectedCode: String = "+234"
    private let flagCodePairs: [(flag: String, code: String)] = [("🇳🇬", "+234"), ("🇺🇸", "+1"), ("🇬🇧", "+44")]
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var navigateToForgetPasswordView = false
    @State private var navigateToCreateAccountView = false
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                HeadingText("Welcome Back to Livio")
                    .padding(.bottom, 8)
                RegularText("Sign in to manage your property or lease.")
                    .lineHeight(.leading(increase: 8))
                    .padding(.bottom, 24)
                
                VStack(alignment: .leading){
                    Text("Phone Number")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.gray950)
                    HStack{
                        Text(" \(selectedCode)")
                            .padding(.horizontal, 12)
                            .font(.system(size: 15))
                        
                        
                        TextField("Phone Number", text: $phoneNumber)
                            .padding(.all, 12)
                        
                        Menu {
                            ForEach(flagCodePairs, id: \.code) { pair in
                                Button(action: {
                                    selectedFlag = pair.flag
                                    selectedCode = pair.code
                                }) {
                                    HStack {
                                        Text(pair.flag)
                                        Text(pair.code)
                                    }
                                }
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Text("\(selectedFlag)")
                                Image(systemName: "chevron.down")
                            }
                        }
                        .foregroundStyle(.gray950)
                        .padding(.horizontal, 12)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3))
                    )
                    .padding(.bottom, 12)
                    
                    //                password
                    VStack(alignment: .leading,) {
                        VStack(alignment: .leading,) {
                            TextFieldText("Password")
                            passwordField(
                                text: $password,
                                placeHolder: "**********",
                                isVisible: $showPassword
                            )
                        }
                        
                        HStack{
                            RegularText("Forgot password?", fontSize: 13)
                            Spacer()
                            NavigationLink("Reset") {
                                ForgetPasswordView()
                            }
                            .font(.system(size: 13))
                            .foregroundStyle(.goldenrod500)
                            .underline()
                                
                        }
                    }
                    
                    
                    
                }.padding(.bottom, 40)
                
                Button{
                    
                } label: {
                    PrimaryButton(title: "Sign In", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroudColor: .primaryButton)
                }
                
                
                
                
                
                
                
                Spacer()
                
                HStack( spacing: 4) {
                    RegularText("Don’t have an account? ")
                    
                    Button("Create an account") {
                        navigateToCreateAccountView = true
                    }
                    .foregroundStyle(.orange)
                    .navigationDestination(isPresented: $navigateToCreateAccountView){
                        CreateAccount()
                    }
                    .navigationBarBackButtonHidden()
                }
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 40)
        }
    }
}

#Preview {
    SignInView()
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

