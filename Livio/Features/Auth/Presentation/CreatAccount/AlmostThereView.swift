//
//  AlmostThereView.swift
//  Livio
//
//  Created by Toluwalase on 08/08/2026.
//

import SwiftUI

struct AlmostThereView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @FocusState private var emailFieldIsFocused: Bool
    
    @State var isOn: Bool = false
//    private func validate(name:String ){}
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading){
                HeadingText("You’re almost there!")
                    .padding(.bottom, 8)
                RegularText("Fill in the following details as it is in your legal documents")
                    .lineHeight(.leading(increase: 8))
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading,){
                    TextFieldText("First Name")
                        .padding(.bottom, 12)
                        .frame(height: 12)
                    
                    
                    
                    TextField("Enter your legal name on ID", text: $firstName,
                              prompt: Text("Enter your legal name on ID")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray600)
                        )
                    .foregroundStyle(.gray950)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(.gray300)
                                )
                        )
                        .contentShape(RoundedRectangle(cornerRadius: 12 ,style: .continuous))
                    
                    RegularText("Fill in the following details as it is in your legal documents", fontSize: 13)
                        .padding(.top, 10)
                }
                .padding(.bottom, 24)
                
                VStack(alignment: .leading) {
                    TextFieldText("Last Name")
                        .padding(.bottom, 12)
                        .frame(height: 12)
                    
                    TextField(
                        "Enter your legal name on ID",
                        text: $lastName,
                        prompt: Text("Enter your legal name on ID")
                  .font(.system(size: 15))
                  .foregroundStyle(.gray600)
                    )
                    .foregroundStyle(.gray950)
                    .focused($emailFieldIsFocused)
                    .onSubmit {
                        
                        if lastName.isEmpty {
                            
                        }
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.gray300)
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12 ,style: .continuous))
                    
                    RegularText("Fill in the following details as it is in your legal documents", fontSize: 13)
                        .padding(.top, 10)
                }
                .padding(.bottom, 24)
                
                
                VStack(alignment: .leading) {
                    TextFieldText("Email")
                        .padding(.bottom, 12)
                        .frame(height: 12)
                    
                    TextField(
                        "Enter your email address",
                        text: $email,
                        prompt: Text("Enter your email address")
                  .font(.system(size: 15))
                  .foregroundStyle(.gray600)
                    )
                    .foregroundStyle(.gray950)
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
                            .fill(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.gray300)
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12 ,style: .continuous))
                    RegularText("We’ll send weekly updates & OTPs for resetting password to this email, confirm you still have access to it at the moment before you continue", fontSize: 13)
                        .padding(.top, 10)
                }
                .padding(.bottom, 24)
                
                HStack( spacing: 4) {
                    
                     
                        Image(systemName: isOn ? "checkmark.square.fill" : "square")
                            .imageScale(.large)
                            .onTapGesture(count: 1) {
                                isOn.toggle()
                            }
                            .foregroundStyle(.gray950)
                    
                    
                    
                    Text("I agree to the \(Text("Terms of Service").foregroundStyle(.goldenrod500)) and \(Text("Privacy Policy").foregroundStyle(.goldenrod500)).")
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundStyle(.gray600)
                }
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 24)
                
                NavigationLink {
                    AgreeAndContView()
                        .navigationBarBackButtonHidden()
                } label: {
                    PrimaryButton(title: "Agree & Continue", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor:  .primaryButton)
                }
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 40)
            .background(.gray50)
        }
    }
}

#Preview {
    AlmostThereView()
}
