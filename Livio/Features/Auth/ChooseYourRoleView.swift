//
//  ChooseYourRoleView.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

enum UserRole{
    case landLord
    case tenant
}

struct ChooseYourRoleView: View {
    @State private var isSelected: UserRole? = nil
    
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HeadingText("Choose your Role")
                    .padding(.bottom, 8)
                RegularText("Choose how you want to use the platform to customize your experience.")
                    .lineHeight(.leading(increase: 8))
                    .padding(.bottom, 20)
                
                

                
                RoleRow(title: "I am a Landlord", subtitle: "Manage properties, track leases, and receive rent payments.", isSelected: isSelected == .landLord, action: { isSelected = .landLord })
                    .padding(.bottom, 12)
                
                
                RoleRow(title: "I am a Tenant", subtitle: "Pay rent, request maintenance,and view your lease details.", isSelected: isSelected == .tenant, action: { isSelected = .tenant })
                    .padding(.bottom, 12)
                
                
                
                Spacer()
                
                
                NavigationLink{
                    MainTabView()
                        .navigationBarBackButtonHidden()
                } label: {
                    PrimaryButton(title: "Continue", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                }
            }
            
            
        }
        .padding(.horizontal, 20)
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(.gray50)
        
    }
}

#Preview {
    ChooseYourRoleView()
}
