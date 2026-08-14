//
//  PaymentsView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct PaymentsView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Payment")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray950)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("💳 Payment")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.light)
            .background(.gray50)
        }
    }
}

#Preview {
    PaymentsView()
}
