//
//  AppBarView.swift
//  Livio
//
//  Created by Toluwalase on 28/08/2026.
//

import SwiftUI

struct AppBarView: View {
    @Environment(\.dismiss) private var dismiss
    let title: String
    let isBackButton: Bool
    let defaultIcon: String?
    let secondIcon: String?
    let isSecondIcon: Bool
    
    init( title: String, isBackButton: Bool, defaultIcon: String? = nil, secondIcon: String? = nil, isSecondIcon: Bool) {
        
        self.title = title
        self.isBackButton = isBackButton
        self.defaultIcon = defaultIcon
        self.secondIcon = secondIcon
        self.isSecondIcon = isSecondIcon
    }
    
    var body: some View {
        HStack(alignment: .center) {
            
            if isBackButton{
                Button {
                    dismiss()
                }label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.gray800)
                        .padding(12)
                        .background(
                            Circle()
                                .fill(.white)
                        )
                }
            }
            Spacer()
            
            HeadingText(title, fontSize: 15)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {}label: {
                Image(defaultIcon ?? "more-vertical")
                    .padding(12)
                    .background(
                        Circle()
                            .fill(.gray100)
                    )
            }
            
            if isSecondIcon{
                Button {}label: {
                    Image(secondIcon ?? "more-vertical")
                        .padding(12)
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
    AppBarView(title: "Notifications", isBackButton: false, defaultIcon: "more-vertical", secondIcon: "settings-02", isSecondIcon: false )
}
