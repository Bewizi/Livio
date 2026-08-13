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
            }
        }.navigationTitle("🏢 Properties")
    }
}

#Preview {
    PropertiesView()
}
