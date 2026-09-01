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
                appBar
                
                Divider()
                    .background(.gray300)
                
//                user info
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
//                        user image
                        HStack(alignment: . top) {
                            HStack(alignment: . top, spacing: 12) {
                                Image("user")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                                    .clipShape(Circle())
                                VStack(alignment:.leading, spacing: 8){
                                    HeadingText("Chidera Nwachukwu", fontSize: 15)
                                    HeadingText("Property Manager", fontSize: 13, fontWeight: .regular, color: .gray600)
                                    HStack{
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.gray50)
                                        HeadingText("Verified Landlord", fontSize: 13, color: .gray50)
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 24)
                                            .fill(.success600.gradient)
                                    )
                                }
                            }
                            Spacer()
                            Image(systemName: "square.and.pencil")
                        }
                        
                        Divider()
                            .padding(.vertical, 12)
                      
                            
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.gray100)
                            .stroke(.gray300)
                    )
                    
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray50)
            .safeAreaInset(edge: .bottom){}
            
        }
    }
    
    private var appBar: some View {
        VStack{
            HeadingText("Settings", fontSize: 15)
        }
    }
}

#Preview {
    ProfileView()
}
