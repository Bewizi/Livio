//
//  MessagesView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Messages")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray950)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("💬 Messages")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.light)
            .background(.gray50)
        }
    }
}

#Preview {
    MessagesView()
}
