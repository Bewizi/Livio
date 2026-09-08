//
//  AppBarHeader.swift
//  Livio
//
//  Created by Toluwalase on 31/08/2026.
//

import SwiftUI

struct AppBarHeader: View {
    var body: some View {
        ZStack {
            HeadingText("Payments", fontSize: 15)
        
            HStack {
                Spacer()
                HStack(spacing: 21) {
                    Image("notification-01")
                    Image("settings-02")
                        .padding(10)
                        .background(
                            Circle()
                                .fill(.gray100)
                        )
                }
            }
        }
    }
}

#Preview {
    AppBarHeader()
}
