//
//  QuickAction.swift
//  Livio
//
//  Created by Toluwalase on 08/09/2026.
//

import SwiftUI

struct QuickAction: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]
    
    let actions = [
                ("Pay Rent", "payment-02"),
                ("Top Up Bill", "invoice"),
                ("Invite", "add-team"),
                ("Report", "complaint"),
                ("View Lease", "document-validation"),
                ("Services", "power-service")
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
    QuickAction()
}


