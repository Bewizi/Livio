//
//  RecentActivityViews.swift
//  Livio
//
//  Created by Toluwalase on 21/08/2026.
//

import SwiftUI

struct RecentActivityViews: View {
    var body: some View {
        HStack(spacing: 12){
            getView(title: "Occupants", subTitle: "400", textColor: .gray950)
            
            getView(title: "Pending Maintenance", subTitle: "12 Requests", textColor: .error600)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    RecentActivityViews()
}

@ViewBuilder private func getView(
    title: String,
    subTitle: String,
    textColor: Color
) -> some View {
    VStack{
        VStack(alignment: .leading, spacing: 8){
            HeadingText(title, fontSize: 13, fontWeight: .regular, color: .gray600)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            HeadingText(subTitle, fontSize: 15, color: textColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(12)
    .background(
        RoundedRectangle(cornerRadius: 16)
            .stroke(.gray300, lineWidth: 1)
    )
}
