//
//  HomeScreen.swift
//  Livio
//
//  Created by Toluwalase on 08/09/2026.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    HStack(spacing: 12){
                        //                image
                        Image( .user)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40,)
                            .clipShape(Circle())
                        //                text
                        HeadingText( "Good Morning Toluwalase", fontSize: 15, fontWeight: .medium, color: .primaryButton)
                    }
                    Spacer()
                    
                    //                icon
                    NavigationLink {
                        
                    }label: {
                        ZStack{
                            Circle()
                                .foregroundStyle(.primaryButton)
                            
                            Image(systemName: "bell")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 40, height: 40)
                        .badge(1)
                    }
                        
                }
                .padding(.top, 40)
                .padding(.horizontal, 20)
                
                Divider()
                    .background(.gray300)
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        
                        
                        VStack(alignment: .leading) {
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.primaryButton)
                                
                                
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading) {
                                        HeadingText("Current Rent Status", fontSize: 13, fontWeight: .regular, color: .gray400)
                                            .padding(.bottom, 8)
                                        
                                        //                                price
                                        HStack(alignment: .top, spacing: -2){
                                            Image(systemName: "nairasign")
                                            
                                            HeadingText(title: Text("450,000.\(Text("00").foregroundStyle(.gray600))"), color: .white)
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.8)
                                        }
                                        .padding(.bottom, 8)
                                        .font(.system(size: 20, weight: .medium,))
                                        .foregroundStyle(.white)
                                        
                                        
                                        //                                hide figures
                                        HeadingText("Next payment scheduled for Jun 1st, 2026", fontSize: 13, fontWeight: .regular, color: .orange400)
                                    }
                                    Spacer()
                                    
                                    HeadingText("Pending", fontSize: 14, fontWeight: .regular, color: .orange400)
                                } .padding(.vertical, 17)
                                    .padding(.horizontal, 16)
                                
                                
                            }
                            .padding(.bottom, 16)
                            
                            HStack{
                                Image(systemName: "exclamationmark.triangle")
                                    .foregroundStyle(.error600)
                                HeadingText("You’re 3 days behind your rent payment", fontSize: 13, fontWeight: .regular, color: .error600)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.error600.opacity(0.10))
                                    .stroke(.error600.opacity(0.50))
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                            
                            
                            HStack(spacing: 12){
                                getView(title: "Outstanding Bills", subTitle: "₦450,000", textColor: .error600)
                                
                                getView(title: "Due Date", subTitle: "Sep 28", textColor: .error600)
                            }
                            .padding(.horizontal, 16)
                        }
                        .padding(.bottom, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.gray100)
                                .stroke(.gray200, lineWidth: 2)
                                
                        )
                        
                        
                        
                    }
                    .padding(.top, 13)
                    .padding(.horizontal, 20)
                }
                
            }
            .background(.gray50)
            .safeAreaBar(edge: .bottom, spacing: 0 ){}
        }
        
        
    }
}

#Preview {
    HomeScreen()
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
