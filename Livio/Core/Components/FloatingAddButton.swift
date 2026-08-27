//
//  FloatingButton.swift
//  Livio
//
//  Created by Toluwalase on 19/08/2026.
//

import SwiftUI

struct FloatingAddButton: View {
    var iconImage: String?

    var body: some View {
        Group {
            if let iconImage = iconImage {
                Image(iconImage)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.white)
            } else {
                Image(systemName: "plus")
                    .font(.system(size: 28, weight: .light))
                    .foregroundStyle(.white)
            }
        }
        .frame(width: 64, height: 64)
        .background(
            Circle()
                .fill(Color.goldenrod500)
        )
        .shadow(
            color: Color.black.opacity(0.18),
            radius: 10,
            x: 0,
            y: 5
        )
        .accessibilityLabel("Add property")
    }
}

#Preview {
    FloatingAddButton(
        iconImage: "quill-write-01"
    )
}
