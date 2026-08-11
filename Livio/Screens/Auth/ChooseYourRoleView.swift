//
//  ChooseYourRoleView.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct ChooseYourRoleView: View {
     @State private var isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                HeadingText("Choose your Role")
                    .padding(.bottom, 8)
                RegularText("Choose how you want to use the platform to customize your experience.")
                    .lineHeight(.leading(increase: 8))
                    .padding(.bottom, 20)
                
                HStack(alignment: .center, spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        HeadingText("I am a Landlord", fontSize: 15)
                        RegularText("Manage properties, track leases, and receive rent payments.", fontSize: 13)
                            .lineHeight(.leading(increase: 8))
                    }
                    Spacer(minLength: 12)
                    RadioButtonRow(isSelected: isSelected, action: {})
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(isSelected ? Color.gray.opacity(0.08) : Color.clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(isSelected ? Color.accentColor : Color.gray.opacity(0.35), lineWidth: isSelected ? 1.5 : 1)
                )
                .contentShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .padding(.bottom, 12)
                
                HStack(alignment: .center, spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        HeadingText("I am a Tenant", fontSize: 15)
                        RegularText("Pay rent, request maintenance,and view your lease details.", fontSize: 13)
                            .lineHeight(.leading(increase: 8))
                    }
                    Spacer(minLength: 12)
                    RadioButtonRow(isSelected: isSelected, action: {})
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(isSelected ? Color.gray.opacity(0.08) : Color.clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(isSelected ? Color.accentColor : Color.gray.opacity(0.35), lineWidth: isSelected ? 1.5 : 1)
                )
                .contentShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                Spacer()
                
                NavigationLink{
                } label: {
                    PrimaryButton(title: "Continue", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroudColor: .primaryButton)
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
