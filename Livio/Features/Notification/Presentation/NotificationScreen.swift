//
//  NotificationScreen.swift
//  Livio
//
//  Created by Toluwalase on 28/08/2026.
//

import SwiftUI

struct NotificationScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    let todayNotification:[NotificationData]=[
        NotificationData(
            icon: "repair",
            title: "New repair request: Leaking tap",
            titleColor: .gray900,
            subtitle: Text("\(Text("Unit 402").foregroundStyle(.goldenrod500)) - Living Room. Tenant reported\nwater pooling near the base of the main\nsink."),
            subtitleColor: .gray800,
            isUnread: true,
            timeStamp: "10:24",
            timeStampColor: .gray600
        ),
        
        NotificationData(
            icon: "alert-01",
            title: "Late payment from Elena\nRochukwu",
            titleColor: .gray600,
            subtitle: Text("\(Text("Unit 402").foregroundStyle(.goldenrod500)) - July rent payment is 3 days late. System reminder has been sent."),
            subtitleColor: .gray600,
            isUnread: false,
            timeStamp: "9:15 AM",
            timeStampColor: .gray400
        ),
        
        NotificationData(
            icon: "message-02",
            title: "New message from Jordan\nHenderson",
            titleColor: .gray900,
            subtitle: Text("Hi, I just wanted to confirm if the parking spot #12 is available..."),
            subtitleColor: .gray800,
            isUnread: true,
            timeStamp: "9:15 AM",
            timeStampColor: .gray600
        )
    ]
    
    let yesterdayNotification:[NotificationData]=[
        NotificationData(
            icon: "repair",
            title: "Rent received for Unit 402",
            titleColor: .gray900,
            subtitle: Text("Full payment of ₦240,000 processed\nsuccessfully via ACH transfer."),
            subtitleColor: .gray800,
            isUnread: true,
            timeStamp: "5:45 PM",
            timeStampColor: .gray600
        ),
        
        NotificationData(
            icon: "license-maintenance",
            title: "Maintenance completed\nfor Unit 115",
            titleColor: .gray600,
            subtitle: Text("HVAC filter replacement finalized by\nContractor Mark Stevens."),
            subtitleColor: .gray600,
            isUnread: false,
            timeStamp: "5:45 PM",
            timeStampColor: .gray400
        ),
        
        NotificationData(
            icon: "document-validation",
            title: "Tenant approved lease\nagreement",
            titleColor: .gray600,
            subtitle: Text("Full payment of ₦240,000 processed\nsuccessfully via ACH transfer."),
            subtitleColor: .gray600,
            isUnread: false,
            timeStamp: "10:24 AM",
            timeStampColor: .gray400
        )
    ]
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                appBar
                
                Divider()
                    .background(Color.gray300)
                
                List{
                    Section{
                        ForEach(todayNotification){notification in
                            NotificationRow(notification: notification)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.gray50)
                        
                    }header: {
                        HStack{
                            HeadingText("Today", fontSize: 13, fontWeight: .regular, color: .gray400)
                            Spacer()
                            HeadingText("Mark as Read", fontSize: 13, color: .goldenrod500)
                        }
                    }
                    
                    Section{
                        ForEach(yesterdayNotification){notification in
                            NotificationRow(notification: notification)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.gray50)
                        
                    }header: {
                        HStack{
                            HeadingText("Yesterday", fontSize: 13, fontWeight: .regular, color: .gray400)
                        }
                    }
                    
                    
                    
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(.gray50)
            }
            .padding(.top, 20)
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar)
            .background(.gray50)
        }
    }
    
    private var appBar: some View {
        HStack(alignment: .center) {
            Button {
                dismiss()
            }label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(.gray800)
                    .padding(12)
                    .background(
                        Circle()
                            .fill(.white)
                    )
            }
            Spacer()
            
            HeadingText("Notifications", fontSize: 15)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {}label: {
                Image("more-vertical")
                    .padding(12)
                    .background(
                        Circle()
                            .fill(.gray100)
                    )
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    NotificationScreen()
}


