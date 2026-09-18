//
//  MaintenanceRequestRow.swift
//  Livio
//
//  Created by Toluwalase on 18/09/2026.
//

import SwiftUI

struct MaintenanceData: Identifiable{
    let id = UUID()
    let icon:String
    let headingOne:String
    let subtitle:String
    let tag:String
    let tagColor:Color
    let tageBgColor:Color
    
}

struct MaintenanceRequestRow:View {
    let request: MaintenanceData
    var body: some View {
        HStack(alignment: .top){
            HStack(alignment: .top, spacing: 12){
                // icon
                Image(request.icon)
                    .padding(8)
                    .background(
                        Circle()
                            .fill(.clear)
                            .stroke(.gray200, lineWidth: 2)
                    )
                VStack(alignment:.leading, spacing: 12){
                    HeadingText(request.headingOne, fontSize: 15, color: .gray900)
                    HeadingText("Willow Park Apartments • Unit 402", fontSize: 13, fontWeight: .regular, color: .gray600)
                    HStack{
                        VStack(alignment:.leading){
                            HeadingText(request.tag, fontSize: 13,fontWeight: .regular, color: request.tagColor)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(request.tageBgColor.opacity(0.15))
                        )
                        
                        HeadingText("12mins ago", fontSize: 13, fontWeight: .regular, color: .gray400)
                    }
                    
                    HeadingText("View Details>>", fontSize: 13, fontWeight: .regular, color: .gray800)
                        .underline()
                }
            }
            
            Spacer()
            
            HeadingText("#REQ-2041", fontSize: 13, fontWeight: .regular, color: .gray500)
                
        }
        
        Divider()
    }
}
