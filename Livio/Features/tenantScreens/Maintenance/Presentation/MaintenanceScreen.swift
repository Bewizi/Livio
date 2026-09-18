//
//  MaintenanceView.swift
//  Livio
//
//  Created by Toluwalase on 08/09/2026.
//

import SwiftUI

struct MaintenanceScreen: View {
    
    let maintenanceRequests:[MaintenanceData] = [
        
        MaintenanceData(
            icon: "gas-pipe",
            headingOne: "Leaky Faucet",
            subtitle: "Willow Park Apartments • Unit 402",
            tag: "Urgent",
            tagColor: .error600,
            tageBgColor: .error600
        ),
        
        MaintenanceData(
            icon: "paint-brush-02",
            headingOne: "Wall Repaint",
            subtitle: "Willow Park Apartments • Unit 402",
            tag: "Medium",
            tagColor: .amberEarth600,
            tageBgColor: .amberEarth600
        ),
        
        MaintenanceData(
            icon: "air-vent",
            headingOne: "AC Vent Repair",
            subtitle: "Willow Park Apartments • Unit 402",
            tag: "Medium",
            tagColor: .amberEarth600,
            tageBgColor: .amberEarth600
        ),
        
        MaintenanceData(
            icon: "windows-new",
            headingOne: "Broken Window",
            subtitle: "Willow Park Apartments • Unit 402",
            tag: "Low",
            tagColor: .charcoalBlue700,
            tageBgColor: .charcoalBlue700
        )
        
    ]
    
    var body: some View {
        VStack{
            MaintenanceAppBar()
                .padding(.horizontal, 20)
            Divider()
            MaintenanceStatusTabs()
                .padding(.vertical, 16)
            VStack{
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing: 24){
                        
                        
                        ForEach(maintenanceRequests){
                            request in
                            MaintenanceRequestRow(request: request)
                        }
                    }
                    
                }
            }
            .padding(.horizontal,20)
            
        }
    }
}

struct MaintenanceAppBar: View {
    var body: some View {
        HStack{
            HeadingText("Maintenance Requests", fontSize: 15)
            
            Spacer()
            
            Label("New Request", systemImage: "plus")
                .font(.system(size: 13))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.goldenrod500.gradient)
                    
                )
        }
        
    }
}

struct StatusTabs:View {
    var body: some View {
                HStack{
                    HStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 8, height: 8)
                        HeadingText("Pending", fontSize: 13, color: .gray50)
                        HeadingText("(12)", fontSize: 13, color: .gray50)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.primaryButton.gradient)
                    )
                    
                    HStack{
    
                        HeadingText("Active", fontSize: 13, color: .gray800)
                        HeadingText("(1)", fontSize: 13, color: .gray800)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.clear)
                            .stroke(.gray200)
                    )
                    
                    
                    HStack{
                        HeadingText("Compeleted", fontSize: 13, color: .gray800)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.clear)
                            .stroke(.gray200)
                    )
                    
                }
    }
}

struct MaintenanceStatusTabs : View {
    var body: some View {
        HStack{
           StatusTabs()
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 60)
            .fill(.clear)
            .stroke(.gray300)
        )
    }
}

#Preview {
    MaintenanceScreen()
}
