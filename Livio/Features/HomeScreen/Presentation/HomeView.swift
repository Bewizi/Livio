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
            ScrollView {
                VStack(alignment:.leading){
                    
                    HStack{
                        HStack(spacing: 12){
                            //                image
                            Image( .user)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40,)
                                .clipShape(Circle())
                            //                text
                            HeadingText( "Good Morning Landlord", fontSize: 15, fontWeight: .medium, color: .primaryButton)
                        }
                        Spacer()
                        
                        //                icon
                        ZStack{
                            Circle()
                                .foregroundStyle(.primaryButton)
                            
                            Image(systemName: "bell")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 40, height: 40)
                            .badge(1)
                            
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 24)
                    
                    VStack {
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.primaryButton)
                            
                            
                            
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    HeadingText("Total Revenue", fontSize: 13, fontWeight: .regular, color: .gray400)
                                        .padding(.bottom, 8)
                                    
                                    //                                price
                                    HStack(alignment: .top, spacing: -2){
                                        Image(systemName: "nairasign")
                                        
                                        HeadingText(title: Text("420,500,000.\(Text("00").foregroundStyle(.gray600))"), color: .white)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.8)
                                    }
                                    .padding(.bottom, 8)
                                    .font(.system(size: 20, weight: .medium,))
                                    .foregroundStyle(.white)
                                    
                                    
                                    //                                hide figures
                                    HStack{
                                        Image(systemName: "eye.slash")
                                            .foregroundStyle(.gray600)
                                        HeadingText("Hide figures", fontSize: 10, color: .gray600)
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical,5)
                                    .frame(width: 120)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 24))
                                }
                                Spacer()
                                
                                HeadingText("+12% vs last mo", fontSize: 14, fontWeight: .regular, color: .success600)
                            } .padding(.vertical, 17)
                                .padding(.horizontal, 16)
                            
                            
                        }
                        .padding(.bottom, 16)
                        
                        HStack(spacing: 12){
                            getView(title: "Occupants", subTitle: "400", textColor: .gray950)
                            
                            getView(title: "Pending Maintenance", subTitle: "12 Requests", textColor: .error600)
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding(.bottom, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.gray100)
                            .stroke(.gray200, lineWidth: 2)
                            
                    )
                    
                    OccupantsView()
                        .padding(.top,16)
                        .padding(.bottom,16)
                    
                    QuickActionsCom().padding(.bottom,16)
                    
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
                }
                
            }.padding(.horizontal, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarTitleDisplayMode(.large)
                .toolbarColorScheme(.light)
                .background(.gray50)
                .safeAreaInset(edge: .bottom, spacing: 0){
                    Color.clear.frame(height: 0)
                }
        }
    }
}

#Preview {
    HomeView()
}

@ViewBuilder private func getView(
    title: String,
    subTitle: String,
    textColor: Color
) -> some View {
    VStack{
        VStack(alignment: .leading, spacing: 8){
            HeadingText(title, fontSize: 13, fontWeight: .regular, color: .gray600)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            HeadingText(subTitle, fontSize: 15, color: textColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(12)
    .background(
        RoundedRectangle(cornerRadius: 16)
            .stroke(.gray300, lineWidth: 1)
    )
}
