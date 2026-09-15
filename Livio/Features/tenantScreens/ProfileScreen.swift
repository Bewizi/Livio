//
//  ProfileScreen.swift
//  Livio
//
//  Created by Toluwalase on 08/09/2026.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack(alignment: .leading) {
            HeadingText("Unit 402, 125 Lekki Phase 1", fontSize: 19)
            Label("Lagos, Nigeria", image: "location-06")
                .foregroundStyle(.gray600)
                .font(.system(size: 13))
            
            VStack (alignment: .leading, spacing: 10){
                Label("Move-in-date", image: "calendar-03")
                    .foregroundStyle(.gray600)
                    .font(.system(size: 13))
                
                HeadingText("Oct 12, 2023", fontSize: 13)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray200)
                    )
                    
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.clear)
                    .stroke(.gray300, )
            )
            
            VStack (alignment: .leading, spacing: 10){
                Label("Rent End", image: "calendar-03")
                    .foregroundStyle(.error600)
                    .font(.system(size: 13))
                
                HeadingText("Oct 11, 2027", fontSize: 13)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray200)
                    )
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.clear)
                    .stroke(.gray300, )
            )
            
            Text("Profile Screen")
        }
    }
}

#Preview {
    ProfileScreen()
}
