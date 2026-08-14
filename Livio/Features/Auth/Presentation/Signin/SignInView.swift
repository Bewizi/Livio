//
//  Sign In.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel: SignInViewModel
    var body: some View {
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
                        Text(" \(viewModel.selectedCode)")
                            .padding(.horizontal, 12)
                            .font(.system(size: 15))
                            .foregroundStyle(.gray800)
                        
                        
                        TextField("Phone Number", text: $viewModel.phoneNumber, prompt: Text("Phone Number").font(.system(size: 15)).foregroundStyle(.gray600),)
                            .foregroundStyle(.gray950)
                            .padding(.all, 12)
                        
                        Menu {
                            ForEach(viewModel.flagCodePairs, id: \.code) { pair in
                                Button(action: {
                                    viewModel.selectedFlag = pair.flag
                                    viewModel.selectedCode = pair.code
                                }) {
                                    HStack {
                                        Text(pair.flag)
                                        Text(pair.code)
                                    }
                                }
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Text("\(viewModel.selectedFlag)")
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
                                text: $viewModel.password,
                                placeHolder: "**********",
                                prompt: Text("Password").font(.system(size: 15)).foregroundStyle(.gray600),
                                isVisible: $viewModel.showPassword
                            )
                            .foregroundStyle(.gray950)
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
                
                
                NavigationLink{
                    MainTabView()
                        .navigationBarBackButtonHidden()
                } label: {
                    PrimaryButton(title: "Sign In", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                }
                
                
                Spacer()
                
                HStack( spacing: 4) {
                    RegularText("Don’t have an account? ")
                    
                    Button("Create an account") {
                        viewModel.navigateToCreateAccountView = true
                    }
                    .foregroundStyle(.orange)
                    .navigationDestination(isPresented: $viewModel.navigateToCreateAccountView){
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
            .background(.gray50)
    }
}

#Preview {
     SignInView(viewModel: SignInViewModel())
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

