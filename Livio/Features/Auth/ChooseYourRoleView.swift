//
//  ChooseYourRoleView.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

enum UserRole: Hashable, Identifiable {
    case landLord
    case tenant

    var id: Self { self }
}

struct ChooseYourRoleView: View {
    @State private var isSelected: UserRole? = nil
    @State private var activeNavigationRole: UserRole? = nil
    
    
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
                
                
                Button{
                    if let role = isSelected {
                        activeNavigationRole = role
                    }
                } label: {
                    PrimaryButton(title: "Continue", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: isSelected != nil ? .primaryButton : .gray300)
                }
            }
            .navigationDestination(item: $activeNavigationRole) { role in
                switch role {
                case .landLord:
                    MainTabView()
                        .navigationBarBackButtonHidden()
                case .tenant:
                    TenantTabView()
                        .navigationBarBackButtonHidden()
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
