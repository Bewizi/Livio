//
//  SlpashScreen.swift
//  Livio
//
//  Created by Toluwalase on 07/08/2026.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack(spacing: 4){
            Image(.logo)
                .resizable()
                
                .frame(width: 90, height: 90)
                
            
            Text("Livio")
                .font(.system(size: 46))
                .fontWeight(.medium)
                .scaledToFit()
                .foregroundStyle(.primaryButton)
            
                
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray50)
    }
}

#Preview {
    SplashScreen()
}
