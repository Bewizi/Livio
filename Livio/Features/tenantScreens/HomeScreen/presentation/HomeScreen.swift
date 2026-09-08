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
                                }
                                .padding(.vertical, 17)
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
                        .padding(.bottom, 16)
                        
                        
                        
                        QuickAction()
                            .padding(.bottom, 16)
                        
                        VStack{
                            HStack{
                                HeadingText("Recent Activity", fontSize: 15)
                                Spacer()
                                HeadingText("View History", fontSize: 15)
                                    .underline()
                            }
                            Divider()
                                .padding(.vertical, 8)
                            
                            HStack(alignment: .top){
                                HStack(alignment: .top, spacing: 9) {
                                    Image("gas-pipe")
                                        .padding(8)
                                        .overlay{
                                            Circle()
                                                .stroke(.gray200)
                                        }
                                    VStack(alignment: .leading, spacing: 8){
                                        HeadingText("Rent Payment Received", fontSize: 15, color: .gray950 )
                                        HeadingText(title: Text("Unit 402, Oak Ridge Estates •\n\(Text("2 hours ago").foregroundStyle(.gray500))"), fontSize: 13, color: .gray800).lineHeight(.leading(increase: 8))
                                    }
                                }
                                
                                Spacer()
                                
                                HStack(spacing: -2){
                                    Image(systemName: "plus")
                                    Image(systemName: "nairasign")
                                    HeadingText("1,850,000.00", fontSize: 15, color: .success600)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                        .minimumScaleFactor(0.8)
                                        
                                }
                                .foregroundStyle(.success600)
                                .font(.system(size: 15))
                            }
                            
                            Divider()
                                .padding(.vertical, 8)
                            
                            HStack(alignment: .top){
                                
                                HStack(alignment: .top, spacing: 9) {
                                    Image("gas-pipe")
                                        .padding(8)
                                        .overlay{
                                            Circle()
                                                .stroke(.gray200)
                                        }
                                    VStack(alignment: .leading, spacing: 8){
                                        HeadingText("Maintenance Request: \nWater Leak", fontSize: 15, color: .gray950 )
                                        HeadingText(title: Text("Unit 115, Sunset Villas • \(Text("8 hours ago").foregroundStyle(.gray500))"), fontSize: 13, color: .gray800).lineHeight(.leading(increase: 8))
                                    }
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
                            
                            Divider()
                                .padding(.vertical, 8)
                        }
                        
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.goldenrod500)

                            HStack(alignment: .center, spacing: 0) {
                                VStack(alignment: .leading) {
                                    HeadingText("Upgrade Your Space", fontSize: 19, color: .gray50)
                                        .padding(.bottom, 4)

                                    HeadingText("Get 10% off professional cleaning services", fontSize: 13, fontWeight: .regular, color: .gray200)
                                        .padding(.bottom, 12)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        

                                    HStack{
                                        HeadingText("Explore Services", fontSize: 10, color: .gray600)
                                        Image(systemName: "arrow.right")
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(.gray50)
                                    )
                                }

                                Spacer(minLength: 12)

                                // Trailing promo image, subtly hidden/clipped inside the card
                                Image("pngegg (1) 1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110)
                                    .opacity(0.9)
                                    .offset(x: 24)
                                    .accessibilityHidden(true)
                            }
                            .padding(.vertical, 17)
                            .padding(.leading, 16)
                            .padding(.trailing, 12)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .contentShape(RoundedRectangle(cornerRadius: 20))
                        
                        
                            
                        
                        
                    }
                    .padding(.top, 13)
                    .padding(.horizontal, 20)
                }
                
            }
            .background(.gray50)
//            .safeAreaBar(edge: .bottom, spacing: 0 ){}
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

