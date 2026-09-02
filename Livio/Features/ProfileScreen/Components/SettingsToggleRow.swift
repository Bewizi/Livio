//
//  SettingsToggleRow.swift
//  Livio
//
//  Created by Toluwalase on 02/09/2026.
//

import SwiftUI

struct SettingsToggleRow: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(title, isOn: $isOn)
            .tint(.goldenrod500)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray300)
            )
    }
}

#Preview {
    SettingsToggleRow(
        title: "Push Notifications", isOn: .constant(true)
    )
}
