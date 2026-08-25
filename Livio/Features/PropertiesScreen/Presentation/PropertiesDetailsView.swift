//
//  PropertiesDetailsView.swift
//  Livio
//
//  Created by Toluwalase on 20/08/2026.
//

import SwiftUI

struct PropertiesDetailsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading) {
                    Image(.property)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 12,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 12,
                                style: .continuous
                            )
                        )
                        .overlay(alignment: .topTrailing) {
                            HStack{
                                Image(systemName: "trash")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.error600)
                                    .padding(12)
                                    .background(
                                        Circle()
                                            .fill(.gray100)
                                            .stroke(.white)
                                    )
                                Image(systemName: "minus")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray600)
                                    .padding(12)
                                    .background(
                                        Circle()
                                            .fill(.gray100)
                                            .stroke(.white)
                                    )
                                Image(systemName: "ellipsis")
                                    .rotationEffect(.degrees(90))
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray600)
                                    .padding(12)
                                    .background(
                                        Circle()
                                            .fill(.gray100)
                                            .stroke(.white)
                                    )
                            }
                            .padding(6)
                            .background(
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(.gray50.opacity(0.9))
                            )
                            .padding(.top, 60)
                            .padding(.trailing)
                        }
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            HeadingText("Oakwood Residency", fontSize: 19)
                                .padding(.bottom, 8)
                            
                            Label {
                                Text("1248 Oceanside Blvd, Marina District")
                            } icon: {
                                Image("location-06")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                            }
                            .foregroundStyle(.gray600)
                            .font(.system(size: 13))
                        }.padding(.bottom, 24)
                        
                        PropertyMetaDataSection()
                        
                        PropertyAmenitiesSection()
                        
                        VStack(alignment: .leading, spacing: 12){
                            HeadingText("Recent Activity", fontSize: 15, color: .gray950 )
                            
                            HStack(alignment: .top){
                                VStack(alignment: .leading, spacing: 8){
                                    HeadingText("Rent Payment Received", fontSize: 15, color: .gray950 )
                                    HeadingText(title: Text("Unit 402, Oak Ridge Estates •\n\(Text("2 hours ago").foregroundStyle(.gray500))"), fontSize: 13, color: .gray800).lineHeight(.leading(increase: 8))
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
                            
                            HStack(alignment: .top){
                                VStack(alignment: .leading, spacing: 8){
                                    HeadingText("Maintenance Request: \nWater Leak", fontSize: 15, color: .gray950 )
                                    HeadingText(title: Text("Unit 115, Sunset Villas • \(Text("8 hours ago").foregroundStyle(.gray500))"), fontSize: 13, color: .gray800).lineHeight(.leading(increase: 8))
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
                        
                        UnitsListTable()
                        
                        VStack(spacing: 8){
                            Button(action: {}){
                                PrimaryButton(title: "View Financials", isBackgroundColor: true, isBorder: false, titleColor: .white, backgroundColor: .primaryButton)
                            }
                            Button(action: {}){
                                PrimaryButton(title: "Edit Property", isBackgroundColor: false, isBorder: true, titleColor: .primaryButton, backgroundColor: .gray50)
                            }
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 24)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 25)
                }
                
                
            }
            .background(.gray50)
            .ignoresSafeArea()
            .safeAreaInset(edge: .bottom, spacing: 2){}
        }
    }
}

#Preview {
    PropertiesDetailsView()
}


