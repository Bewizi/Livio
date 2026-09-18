//
//  ProfileScreen.swift
//  Livio
//
//  Created by Toluwalase on 08/09/2026.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack(alignment: .leading){
            
            ZStack(alignment: .topLeading){
                Image("property")
                    .resizable()
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .clipShape(
                        UnevenRoundedRectangle(
                            bottomLeadingRadius: 44,
                            bottomTrailingRadius: 44
                        )
                    )
                
                HStack{
                    Label("Tenant Portal", systemImage: "arrow.left")
                        .padding(9)
                        .background(
                            RoundedRectangle(cornerRadius: 60)
                                .fill(.white)
                        )
                    
                    Spacer()
                    
                    HStack(spacing: 12){
                        Image("complaint 1")
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(.gray100)
                                    .overlay(
                                        Circle().stroke(.white)
                                    )
                            )
                        Image("more-vertical")
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(.gray100)
                                    .overlay(
                                        Circle().stroke(.white)
                                    )
                            )
                    }
                    .padding(9)
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .fill(.white)
                    )
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 70)
                
                
                VStack {
                     PropertyManagerCard()
                         .padding(.horizontal, 20)
                         .padding(.top, 260)
                 }
            }
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 8){
                        HeadingText("Unit 402, 125 Lekki Phase 1", fontSize: 19)
                        Label("Lagos, Nigeria", image: "location-06")
                            .foregroundStyle(.gray600)
                            .font(.system(size: 13))
                    }
                    .padding(.bottom, 16)
                    
                    
                    HStack{
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
                        
                        Spacer()
                        
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
                        
                    }
                    .padding(.bottom, 16)
                    
                    VStack{
                        
                        UserSettings(labelText: "Settings", labelImage: "settings-02")
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray300)
                    )
                    .padding(.bottom, 16)
                    
                    VStack(alignment: .leading, spacing: 12){
                        HeadingText("Lease & Safety", fontSize: 15, color: .gray900)
                        
                        UserSettings(labelText: "View Lease", labelImage: "agreement-03")
                        
                        UserSettings(labelText: "Property Rules", labelImage: "book-text")
                        
                        UserSettings(labelText: "Emergency Contacts", labelImage: "siren")
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray300)
                    )
                    .padding(.bottom, 16)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 12){
                        HeadingText("Your Activity", fontSize: 15, color: .gray950 )
                        Divider()
                        
                        HStack(alignment: .top){
                            VStack(alignment: .leading, spacing: 8){
                                HeadingText("Rent Payment Received", fontSize: 15, color: .gray950 )
                                    .fixedSize(horizontal: true, vertical: true)
                                HeadingText(title: Text("Unit 402, Oak Ridge Estates •\n\(Text("2 hours ago").foregroundStyle(.gray500))"), fontSize: 13, color: .gray800).lineHeight(.leading(increase: 8))
                                    .fixedSize(horizontal: true, vertical: true)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: -2){
                                Image(systemName: "plus")
                                Image(systemName: "nairasign")
                                HeadingText("1,850,000.00", fontSize: 15, color: .success600)
                            }
                            .foregroundStyle(.success600)
                            .font(.system(size: 15))
                        }
                        
                        Divider()
                        
                        HStack(alignment: .top){
                            VStack(alignment: .leading, spacing: 8){
                                HeadingText("Maintenance Request: Water \nLeak", fontSize: 15, color: .gray950 )
                                    .fixedSize(horizontal: true, vertical: true)
                                HeadingText(title: Text("Unit 115, Sunset Villas • \(Text("8 hours ago").foregroundStyle(.gray500))"), fontSize: 13, color: .gray800).lineHeight(.leading(increase: 8))
                                    .fixedSize(horizontal: true, vertical: true)
                            }
                            
                            Spacer()
                            
                            HStack(){
                                HeadingText("High Priority", fontSize: 10, color: .error600)
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color.error600.opacity(0.15))
                            )
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .background(.gray50)
                
                .safeAreaInset(edge: .bottom, content: {}, )
            }
        }
        .ignoresSafeArea()
    }
}

struct UserSettings: View {
    
    let labelText: String
    let labelImage: String
    
    var body: some View {
        HStack{
            Label(labelText, image: labelImage)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal,12)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray300)
        )
    }
}

struct PropertyManagerCard: View {
    var body: some View {
        HStack{

            HStack(spacing: 10){
                // Profile image
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())

                // Text
                VStack(alignment: .leading, spacing: 4) {
                    Text("Property Manager")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray300)

                    Text("Chidera Nwachukwu")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.gray50)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 60)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .fill(.black.opacity(0.45))
                    )
            )

          

            Spacer()

            // Chat button
            Image(systemName: "ellipsis.message.fill")
                .font(.system(size: 18))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(
                    Circle()
                        .fill(.clear)
                        .overlay(
                            Circle()
                                .stroke(.white.opacity(0.8), lineWidth: 1)
                        )
                )
        }
        .padding(.horizontal, 9)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 60)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .fill(.black.opacity(0.65))
                )
        )
    }
}

#Preview {
    ProfileScreen()
}
