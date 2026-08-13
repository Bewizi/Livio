//
//  AppButton.swift
//  Livio
//
//  Created by Toluwalase on 07/08/2026.
//

import SwiftUI

struct PrimaryButton: View {

    
    let title: String
    let isBackgroundColor: Bool
    let isBorder: Bool
    let titleColor: Color
    let backgroundColor: Color?
    
    
    var body: some View {
        
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .foregroundStyle(titleColor)
        
        .padding(.horizontal, 20)
        
        .background{
            if isBackgroundColor{
                RoundedRectangle(cornerRadius: 24)
                    .fill(((backgroundColor ?? .primaryButton)).gradient)
                    .overlay(
                        LinearGradient(colors: [
                            Color.white.opacity(0.18),
                            Color.clear
                        ], startPoint: .top, endPoint: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                    )
            }
            
        }
        .overlay{
            if isBorder{
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.primaryButton, lineWidth: 1)
            }
        }
        
        
        
    }
}

