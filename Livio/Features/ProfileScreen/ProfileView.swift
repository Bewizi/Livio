//
//  ProfileView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray950)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("👤 Profile")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.light)
            .background(.gray50)
            
        }
    }
}

#Preview {
    ProfileView()
}
