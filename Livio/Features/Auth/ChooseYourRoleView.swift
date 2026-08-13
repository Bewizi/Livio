//
//  ChooseYourRoleView.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI

struct ChooseYourRoleView: View {
     @State private var isTenantSelected: Bool = false
    @State private var isLandLordSelected: Bool = false
    
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
                    RadioButtonRow(isSelected: isLandLordSelected, action: {
                        isLandLordSelected.toggle()
                    })
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(isLandLordSelected ? Color.clear : Color.clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(isLandLordSelected ? .gray600 : .gray300, lineWidth: isLandLordSelected ? 1 : 1)
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
                    RadioButtonRow(isSelected: isTenantSelected, action: {
                        isTenantSelected.toggle()
                    })
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(isTenantSelected ? Color.clear : Color.clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(isTenantSelected ? .gray600 : .gray300, lineWidth: isTenantSelected ? 1 : 1)
                )
                .contentShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                Spacer()
                
                NavigationLink{
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
