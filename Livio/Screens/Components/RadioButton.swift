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
                    .fill(isSelected ? Color.gray.opacity(0.08) : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(isSelected ? Color.accentColor : Color.gray.opacity(0.35), lineWidth: isSelected ? 1.5 : 1)
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
                    .foregroundColor(isSelected ? .gray950 : .greu600)
                    .font(.system(size: 22))
                
                
            }
            .padding(.vertical, 8)
        }
    }
}
