//
//  QuickActionsCom.swift
//  Livio
//
//  Created by Toluwalase on 17/08/2026.
//

import SwiftUI

struct QuickActionsCom: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]
    
    let actions = [
                ("New Tenant", "add-team"),
                ("Maintenance", "license-maintenance"),
                ("Broadcast", "megaphone-01"),
                ("New Property", "home-11"),
                ("Top Up Bill", "invoice"),
                ("Create Invoice", "add-invoice")
    ]
    
    var body: some View {
        VStack(alignment: .leading,){
            HeadingText("Quick Actions", fontSize: 15)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .padding(.bottom, 12)
            
            
            LazyVGrid(columns: columns, spacing: 12){
                ForEach(actions, id: \.0){
                    action in
                    QuickActionContainer(text: action.0, icon: action.1)
                }
            }
            
            
            
        }
        
    }
}

#Preview {
    QuickActionsCom()
}

@ViewBuilder func QuickActionContainer(text: String, icon: String,  ) -> some View {
    VStack(spacing: 8){
        ZStack{
            Circle().fill(.primaryButton).frame(width: 50)
            Image(icon)
                .renderingMode(.template)
                .foregroundStyle(.white)
        }
        HeadingText(text, fontSize: 12)
    }
    .frame(maxWidth: .infinity)

    .padding(12)
    .background(
        RoundedRectangle(cornerRadius: 8)
            .fill(.gray100)
            .stroke(.gray200, lineWidth: 2)
    )
    
}
