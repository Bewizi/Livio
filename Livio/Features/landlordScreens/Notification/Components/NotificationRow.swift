//
//  NotificationRow.swift
//  Livio
//
//  Created by Toluwalase on 28/08/2026.
//

import SwiftUI

struct NotificationData: Identifiable{
    let  id = UUID()
    let icon: String
    let title: String
    let titleColor: Color
    let subtitle: Text
    let subtitleColor: Color
    let isUnread: Bool
    let timeStamp: String
    let timeStampColor: Color
    var iconColor: Color?
    
    
}

struct NotificationRow: View {
    
    let notification: NotificationData
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top,){
                HStack(alignment: .top, spacing: 12){
                    Image(notification.icon)
                        .renderingMode(.template)
                        .foregroundStyle(notification.iconColor ?? .black)
                        .padding(12)
                        .background(
                            Circle()
                                .fill(.gray100)
                        )
                        
                    VStack(alignment: .leading, spacing: 8) {
                        HeadingText(notification.title, fontSize: 15, color: notification.titleColor)
                        
                        Text("\(notification.subtitle)")
                            .font(.system(size: 13))
                            .foregroundStyle(notification.subtitleColor)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineHeight(.leading(increase: 5))
                    }
                }
                
                Spacer()
                
                HStack(alignment: .top,) {
                    HeadingText(notification.timeStamp, fontSize: 13, fontWeight: .regular, color: notification.timeStampColor)
                        
                    if notification.isUnread {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                    }
                }
            }
            
         
            
        }
    }
}

#Preview {
    NotificationRow(
        notification:
            NotificationData(
                icon: "repair",
                title: "New repair request: Leaking tap",
                titleColor: .gray900,
                subtitle: Text("\(Text("Unit 402").foregroundStyle(.goldenrod500)) - Living Room. Tenant reported\nwater pooling near the base of the main\nsink."),
                subtitleColor: .gray600,
                isUnread: true,
                timeStamp: "10:24",
                timeStampColor: .gray400
            )
    )
}

