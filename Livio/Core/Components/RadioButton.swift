//
//  RadioButton.swift
//  Livio
//
//  Created by Toluwalase on 10/08/2026.
//

import SwiftUI


struct RoleRow: View {
    let title: String
    let subtitle: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    HeadingText(title, fontSize: 15)
                    RegularText(subtitle, fontSize: 13)
                        .lineHeight(.leading(increase: 8))
                        .frame(width: 250, alignment: .leading)
                }
                .multilineTextAlignment(.leading)

                Spacer()

                
                RadioButtonRow(isSelected: isSelected, action: {})
                    .allowsHitTesting(false) // Button handles the tap
            }
            // Generous internal padding to create spacious feel
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            // Full-width look with rounded shape and border
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(isSelected ? Color.clear : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(isSelected ? .gray600 : .gray300, lineWidth: isSelected ? 1 : 1)
            )
            .contentShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .buttonStyle(.plain) // Preserve our custom styling
    }
}

struct RadioButtonRow: View {
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                // Toggles between checked and unchecked circle images
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isSelected ? .gray950 : .gray600)
                    .font(.system(size: 22))
                
                
            }
            .padding(.vertical, 8)
        }
    }
}
