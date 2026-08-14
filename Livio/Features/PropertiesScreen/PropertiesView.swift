//
//  PropertiesView.swift
//  Livio
//
//  Created by Toluwalase on 13/08/2026.
//

import SwiftUI

struct PropertiesView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Properties")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray950)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("🏢 Properties")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.light)
            .background(.gray50)
            
        }
    }
}

#Preview {
    PropertiesView()
}
