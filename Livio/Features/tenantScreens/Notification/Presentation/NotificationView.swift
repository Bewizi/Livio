//
//  NotificationView.swift
//  Livio
//
//  Created by Toluwalase on 09/09/2026.
//

import SwiftUI

struct NotificationView: View {
    
    let todayNotification:[NotificationData]=[
        NotificationData(
            icon: "checkmark-circle-02",
            title: "Rent Payment Received",
            titleColor: .gray900,
            subtitle: Text("Your payment of ₦450,000 for October has been successfully processed."),
            subtitleColor: .gray800,
            isUnread: true,
            timeStamp: "10:24 AM",
            timeStampColor: .gray600
        ),
        
        NotificationData(
            icon: "license-maintenance",
            title: "Maintenance Update",
            titleColor: .gray600,
            subtitle: Text("The technician is scheduled to arrive at 2:00 PM for your 'Kitchen Sink Leakage' request."),
            subtitleColor: .gray600,
            isUnread: false,
            timeStamp: "9:15 AM",
            timeStampColor: .gray400
        ),
        
        NotificationData(
            icon: "message-02",
            title: "New message from your \nLandlord",
            titleColor: .gray900,
            subtitle: Text("Hi, I just wanted to confirm if you’ll be available to host tonight’s meeting"),
            subtitleColor: .gray800,
            isUnread: true,
            timeStamp: "9:15 AM",
            timeStampColor: .gray600
        )
    ]
    
    let yesterdayNotification:[NotificationData]=[
        NotificationData(
            icon: "megaphone-01",
            title: "Community News",
            titleColor: .gray900,
            subtitle: Text("The swimming pool will be closed for routine maintenance this Saturday from 8 AM to 12 PM."),
            subtitleColor: .gray800,
            isUnread: true,
            timeStamp: "5:45 PM",
            timeStampColor: .gray600
        ),
        
        NotificationData(
            icon: "utility-pole",
            title: "Utility Bill Due",
            titleColor: .gray600,
            subtitle: Text("Your electricity token balance is low. \nTop up now to avoid disconnection."),
            subtitleColor: .gray600,
            isUnread: false,
            timeStamp: "11:20 AM",
            timeStampColor: .gray400
        ),
        
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                AppBarView( title: "Notification", isBackButton: true, isSecondIcon: false)
                    .padding(.horizontal, 20)
                Divider()
                    .background(.gray300)
                
                List{
                    Section{
                        ForEach(todayNotification){notification in
                            NotificationRow(notification: notification)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.gray50)
                        
                    }header: {
                        HStack{
                            HStack {
                                HeadingText("Today", fontSize: 13, fontWeight: .regular, color: .gray400)
                                HeadingText("(2unread)", fontSize: 13, fontWeight: .regular, color: .gray800)
                            }
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
            .navigationBarBackButtonHidden()
            .background(.gray50)
        }
        
    }
}

#Preview {
    NotificationView()
}
