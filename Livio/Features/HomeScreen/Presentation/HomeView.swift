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
                            
                    }.padding(.bottom, 24)
                    
                    VStack {
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.primaryButton)
                            
                            
                            
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    HeadingText("Total Revenue", fontSize: 13, fontWeight: .regular, color: .gray400)
                                        .padding(.bottom, 8)
                                    
                                    //                                price
                                    HStack(alignment: .top){
                                        Image(systemName: "nairasign")
                                        
                                        Text("420,500,000.\(Text("00").foregroundStyle(.gray600))")
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.8)
                                    }
                                    .padding(.bottom, 8)
                                    .font(.system(size: 29, weight: .medium,))
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
                        
                        
                    
                        
                }
                
            }.padding(.horizontal, 20)
                .padding(.top, 40)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarTitleDisplayMode(.large)
                .toolbarColorScheme(.light)
                .background(.gray50)
                .safeAreaInset(edge: .bottom, spacing: 0){}
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
