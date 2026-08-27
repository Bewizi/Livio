//
//  MessageRow.swift
//  Livio
//
//  Created by Toluwalase on 27/08/2026.
//

import SwiftUI



struct MessageData: Identifiable , Hashable{
    let id = UUID()
    let senderName: String
    let subtitle: String
    let subtitleColor: Color
    let preview: String
    let timestamp: String
    let isUnread: Bool
    let avatarImageName: String?
    
    static func == (lhs: MessageData, rhs: MessageData) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


struct MessageRow: View {
    
    
    let message: MessageData
    
    var body: some View {
        NavigationLink {
           ChatView(message: message)
        }label: {
            HStack(alignment: .top, spacing: 12) {
                // Avatar
                if let imageName = message.avatarImageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray300)
                        .frame(width: 48, height: 48)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(message.senderName)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.gray950)
                        
                        Spacer()
                        
                        HStack(spacing: 6) {
                            Text(message.timestamp)
                                .font(.system(size: 13))
                                .foregroundStyle(.gray500)
                            if message.isUnread {
                                Circle()
                                    .fill(Color.error600)
                                    .frame(width: 6, height: 6)
                            }
                        }
                    }
                    
                    Text(message.subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(message.subtitleColor)
                    
                    Text(message.preview)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray700)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 250, alignment: .leading)
                }
            }
            .padding(.vertical, 12)
        }
    
    }
}

#Preview {
    MessageRow(message: MessageData.init(senderName: "Elena Rochukwu", subtitle: "Unit 208", subtitleColor: .success600, preview: "The kitchen sink is still leaking after the repair attempt yesterday...", timestamp: "2m ago", isUnread: true, avatarImageName: "user"))
}
