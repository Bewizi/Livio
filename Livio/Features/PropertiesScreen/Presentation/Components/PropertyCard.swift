//
//  PropertyCard.swift
//  Livio
//
//  Created by Toluwalase on 19/08/2026.
//

import SwiftUI

struct PropertyCard: View {
    @State  var propertyName: String
    @State  var propertyAddress: String
    @State  var progressValue: Double
    @State var progressPercent: String
    @State  var units: String
    @State  var leased: String
    var body: some View {
        VStack(alignment: .leading){
            Image(.property)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,)
                .clipShape(
                    .rect(
                        topLeadingRadius: 12,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 12,
                        style: .continuous
                    )
                )
            
            
            VStack(alignment: .leading, spacing: 8) {
                
                HeadingText(propertyName, fontSize: 15)
                HeadingText(propertyAddress, fontSize: 13, fontWeight: .regular, color: .gray600)
                
                
                propertyUnitAndLeased(
                    units: units, leased: leased
                )
                
                
                VStack {
                    ProgressView(value: progressValue, total: 100)
                        .tint(.goldenrod500)
                    HStack{
                        HeadingText("Occupancy Rate", fontSize: 13, color: .gray900)
                        Spacer()
                        HeadingText(title:Text("\(progressPercent)%"),fontSize: 13, color: .goldenrod500)
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 16)
            }.padding(.horizontal, 12)
                .padding(.top, 16)
            
            
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray50)
                .stroke(.gray300)
        )
    }
}

#Preview {
    PropertyCard(
        propertyName: "Harborview Towers", propertyAddress: "1248 Oceanside Blvd, Marina District", progressValue: 23, progressPercent: "23", units: "24 Units", leased: "22/24 Leased",
    )
}

@ViewBuilder
func propertyUnitAndLeased(
    // icon1: String,
    units: String,
    leased: String,
    // icon2: String
) -> some View{
    
    HStack{
        HStack(spacing: 10){
            Label(units, systemImage: "building.2.fill")
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.gray600)
            
            Label(leased, systemImage: "person.2")
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.gray600)
        }
        
        
        
        Spacer()
        
        HStack{
            Image(systemName: "person.2.badge.plus")
                .font(.system(size: 13))
                .foregroundStyle(.primaryButton)
                .padding(12)
                .background(
                    Circle()
                        .stroke(.primaryButton, lineWidth: 2)
                    
                )
            
            Image(systemName: "megaphone")
                .font(.system(size: 13))
                .foregroundStyle(.white)
                .padding(12)
                .background(
                    Circle()
                        .fill(.primaryButton)
                )
        }
    }
}




