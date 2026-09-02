//
//  SettingsNavigationRow.swift
//  Livio
//
//  Created by Toluwalase on 02/09/2026.
//

import SwiftUI

struct SettingsNavigationRow: View {
    let title: String
    var subtitle: String?
    var subtitleColor: Color?
    
    var body: some View {
        
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HeadingText(title, fontSize: 15, color: .gray900)
                    if (subtitle != nil) {
                        HeadingText(subtitle, fontSize: 13, color: subtitleColor)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 24))
                    .foregroundStyle(.gray500)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray300)
            )
        
    }
}

#Preview {
    SettingsNavigationRow(
        title: "Two-factor authentication", subtitle: "Disabled"
    )
}
