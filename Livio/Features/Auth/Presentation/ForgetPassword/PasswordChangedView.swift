//
//  PasswordChanged.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct PasswordChangedView: View {
    var body: some View {
            VStack{
                ZStack {
                    Circle()
                        .strokeBorder(.brightfern.opacity(50), lineWidth: 4)
                        .background(
                            Circle().fill(Color.brightfern)
                        ).frame(width: 76, height: 76)
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .foregroundStyle(.white)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .padding(.bottom, 12)
                
                VStack{
                    HeadingText("Password Changed")
                        .padding(.bottom, 8)
                    RegularText("Your password has been successfully changed")
                        .lineHeight(.leading(increase: 8))
                        
                }
                .padding(.bottom, 40)
                
                
                
                NavigationLink(destination: SignInView(viewModel: SignInViewModel())) {
                    PrimaryButton(title: "Back to login", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                }
                
                
            }.padding(.horizontal, 20)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray50)
        }
}

#Preview {
    PasswordChangedView()
}
