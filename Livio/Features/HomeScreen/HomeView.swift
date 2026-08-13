//
//  HomeView.swift
//  Livio
//
//  Created by Toluwalase on 13/08/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }.navigationTitle("🏠 Home")
    }
}

#Preview {
    HomeView()
}
