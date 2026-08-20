//
//  FloatingButton.swift
//  Livio
//
//  Created by Toluwalase on 19/08/2026.
//

import SwiftUI

struct FloatingAddButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 28, weight: .light))
                .foregroundStyle(.white)
                .frame(width: 64, height: 64)
                .background(
                    Circle()
                        .fill(Color.goldenrod500)
                )
                .shadow(color: Color.black.opacity(0.18), radius: 10, x: 0, y: 5)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Add property")
    }
}


#Preview {
    FloatingAddButton(
        action: {}
    )
}
