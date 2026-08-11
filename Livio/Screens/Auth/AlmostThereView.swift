//
//  AlmostThereView.swift
//  Livio
//
//  Created by Toluwalase on 08/08/2026.
//

import SwiftUI

struct AlmostThereView: View {
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    
    @FocusState private var emailFieldIsFocused: Bool
    
    @State var isOn: Bool = false
//    private func validate(name:String ){}
    
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                             .green, .blue, .purple, .pink]
      @State private var fgColor: Color = .gray
    
    
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
                    
                    
                    TextField("Enter your legal name on ID", text: $firstname)
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
                        text: $lastname
                    )
                    .focused($emailFieldIsFocused)
                    .onSubmit {
                        
                        if lastname.isEmpty {
                            
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
                    
                    
                    
                    Text("I agree to the \(Text("Terms of Service").foregroundStyle(.goldenrod500)) and \(Text("Privacy Policy").foregroundStyle(.goldenrod500)).")
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                        .foregroundStyle(.greu600)
                }
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 24)
                
                NavigationLink {
                    AgreeAndContView()
                        .navigationBarBackButtonHidden()
                } label: {
                    PrimaryButton(title: "Agree & Continue", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroudColor: .primaryButton)
                }
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 40)
        }
    }
}

#Preview {
    AlmostThereView()
}
