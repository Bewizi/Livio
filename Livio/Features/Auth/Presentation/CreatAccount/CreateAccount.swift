//
//  CreateAccount.swift
//  Livio
//
//  Created by Toluwalase on 07/08/2026.
//

import SwiftUI

struct CreateAccount: View {
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var selectedFlag: String = "🇳🇬"
    @State private var selectedCode: String = "+234"
    private let flagCodePairs: [(flag: String, code: String)] = [("🇳🇬", "+234"), ("🇺🇸", "+1"), ("🇬🇧", "+44")]
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var navigateToVerifyPhoneView = false
    @State private var navigateToSignInView = false
    
    private func createAccount(){
        print(
            phoneNumber,
            password,
            confirmPassword
        )
    }
    
    var body: some View {
            VStack(alignment:.leading){
                HeadingText("Sign up on Livio")
                    .padding(.bottom, 8)
                RegularText("Create your account to start managing your lease and payments securely.")
                    .lineHeight(.leading(increase: 8))
                    .padding(.bottom, 20)
                
                
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.gray950)
                    HStack{
                        Text(" \(selectedCode)")
                            .padding(.horizontal, 12)
                            .font(.system(size: 15))
                            .foregroundStyle(.gray800)
                            
                        
                        TextField("Phone Number", text: $phoneNumber,
                                  prompt: Text("Phone Number")
                            .font(.system(size: 15))
                            .foregroundStyle(.gray600)
                        )
                        .keyboardType(.phonePad)
                        .foregroundStyle(.gray950)
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
                        TextFieldText("Password")
                        passwordField(
                            text: $password,
                            placeHolder: "**********",
                            prompt: Text("**********")
                      .font(.system(size: 15))
                      .foregroundStyle(.gray600),
                            isVisible: $showPassword
                        )
                        .foregroundStyle(.gray950)
                    }
                    
                    //                confirm password
                    VStack(alignment: .leading, spacing: 12) {
                        TextFieldText("Confirm Password")
                        passwordField(
                            text: $confirmPassword,
                            placeHolder: "**********",
                            prompt: Text("**********")
                      .font(.system(size: 15))
                      .foregroundStyle(.gray600),
                            isVisible: $showConfirmPassword
                        )
                    }
                    .foregroundStyle(.gray950)
                    .padding(.bottom, 12)
                    
                    
                }
                Spacer()
                
                 
                    
                    Button{
                        createAccount()
                        
                        navigateToVerifyPhoneView = true
                    }label: {
                        PrimaryButton(title: "Create an account", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                    }.padding(.bottom, 8)
                    .navigationDestination(isPresented: $navigateToVerifyPhoneView, destination: {
                        VerifyPhoneView()
                            .navigationBarBackButtonHidden()
                    }
                    )
                
                HStack( spacing: 4) {
                    RegularText("Already have an account?")
                    
                    Button("Sign In") {
                        navigateToSignInView = true
                    }
                    .foregroundStyle(.orange)
                    .navigationDestination(isPresented: $navigateToSignInView){
                        SignInView(viewModel: SignInViewModel())
                    }.navigationBarBackButtonHidden()
                }
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 20)
            .padding(.top, 40)
            .background(.gray50)
    }
}

#Preview {
    CreateAccount()
}


@ViewBuilder
private func passwordField(
    text: Binding<String>,
    placeHolder: String,
    prompt: Text,
    isVisible: Binding<Bool>,
    hasError: Bool = false
)->some View{
    HStack{
        if isVisible.wrappedValue{
            TextField(placeHolder, text: text, prompt: prompt)
        }else{
            SecureField(placeHolder, text: text, prompt: prompt)
            
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

