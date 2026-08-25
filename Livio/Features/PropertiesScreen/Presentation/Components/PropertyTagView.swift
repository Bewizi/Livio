//
//  PropertyTagView.swift
//  Livio
//
//  Created by Toluwalase on 20/08/2026.
//

import SwiftUI

struct PropertyTagView: View {
    let icon: String
    let text: String
    var body: some View {
        HStack{
            Label{
                Text(text)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }icon: {
                Image(icon)
                    .foregroundStyle(.red)
            }
        }
        .padding(7)
        .font(.system(size: 13, weight: .medium))
        .foregroundStyle(.gray600)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray300)
        )
    }
}

struct PropertyMetaDataSection: View {
    var body: some View {
        ViewThatFits{
            HStack{
                PropertyTagView(icon: "user-multiple", text: "Multi-Family")
                PropertyTagView(icon: "square-stack", text: "12,450 sq ft")
                PropertyTagView(icon: "time-03", text: "Built 2018")
            }
        }
        
        HStack {
            PropertyTagView(icon: "checkmark-circle-02", text: "Active")
        }
        .padding(.top, 4)
    }
}
