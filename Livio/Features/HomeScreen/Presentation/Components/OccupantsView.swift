//
//  OccupantsView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct OccupantsView: View {
    
    private var occupants: [ImageResource] = [.user, .user, .user,.user,.user,.user]
    
    var body: some View {
        HStack{
            HStack(spacing: 4){
                HeadingText("New Occupants", fontSize: 15)
                Circle()
                    .foregroundStyle(.error600)
                    .frame(width: 5)
            }
            Spacer()
            
            HStack(spacing: -10){
                ForEach(occupants, id: \.self) { image in
                    avatar(for: image)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray100)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray200, lineWidth: 1)
                )
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    OccupantsView()
}

@ViewBuilder private func avatar(for user: ImageResource) -> some View {
    Image(user)
        .resizable()
        .scaledToFit()
        .frame(width: 40)
        .clipShape(Circle())
        .background(
            Circle()
            .fill(.white)
            .frame(width: 44)
        )
}
