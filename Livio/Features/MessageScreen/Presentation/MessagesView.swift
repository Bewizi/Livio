//
//  MessagesView.swift
//  Livio
//
//  Created by Toluwalase on 14/08/2026.
//

import SwiftUI

struct MessagesView: View {
    
    
    @State var searchText = ""
    @State private var selectedFilter : String  = "All"
    @State var messages: [MessageData] = [
        MessageData(
            senderName: "Elena Rochukwu",
            subtitle: "Unit 208",
            subtitleColor: .goldenrod500,
            preview: "The kitchen sink is still leaking after the repair attempt yesterday...",
            timestamp: "Now",
            isUnread: false,
            avatarImageName: "user"),
        
        MessageData(
            senderName: "David Chen",
            subtitle: "General Maintenance",
            subtitleColor: .success600,
            preview: "Work order #4402 has been completed for the HVAC filters.",
            timestamp: "2m ago",
            isUnread: true,
            avatarImageName: "user"
                   ),
        
        MessageData(
            senderName: "Abdul UIUX",
            subtitle: "Unit 105",
            subtitleColor: .goldenrod500,
            preview: "Thanks for the update on the parking lot repaving schedule.",
            timestamp: "4h ago",
            isUnread: false,
            avatarImageName: "user"
        ),
        
        MessageData(
            senderName: "Jacklyn Tilley-Gyado",
            subtitle: "Unit 402",
            subtitleColor: .goldenrod500,
            preview: "I've sent the rent payment through the portal just now. Have a nice day!",
            timestamp: "Yesterday",
            isUnread: true,
            avatarImageName: "user"
        ),
        
        MessageData(
            senderName: "Kelvin Emmanuel",
            subtitle: "Unit 312",
            subtitleColor: .goldenrod500,
            preview: "Is it possible to renew my lease for another 6 months instead of a year?",
            timestamp: "2 days ago",
            isUnread: false,
            avatarImageName: "user"
        ),
    ]
    
    @State var filters: [String] = [
        "All",
        "Unread",
        "Maintenance",
        "Tenants"
    ]
    
    
    
    var filteredMessages: [MessageData]{
        switch selectedFilter {
        case "Unread":
            return messages.filter{$0.isUnread}
        case "Maintenance":
            return messages.filter{$0.subtitle.contains("Maintenance")}
        case "Tenants":
            return messages.filter{!$0.subtitle.contains("Maintenance")}
        default:
            return messages
        }
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottomTrailing) {
                VStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray500)
                        TextField("Search", text: $searchText,
                        )
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .font(.system(size: 15))
                        .foregroundStyle(.gray950)
                        .tint(.gray600)
                        .colorScheme(.light)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 48)
                            .fill(Color.gray50)
                            .stroke(.gray300, lineWidth: 2)
                        
                    )
                    .padding(.bottom, 12)
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 8) {
                            ForEach(filters, id: \.self){
                                filter in
                                FilterChip(title:filter , isSelected: selectedFilter == filter)
                                    .onTapGesture {
                                        selectedFilter = filter
                                    }
                            }
                            
                        }
                        
                    }
                    
                    ScrollView{
                        LazyVStack(spacing: 0) {
                            ForEach(filteredMessages) { message in
                                MessageRow(message: message)
                                
                                Divider()
                                    .background(.gray300)
                            }
                        }
                    }
                    
                    
                    
                    
                }
                .padding(.top, 40)
                .padding(.horizontal, 20)
                .navigationTitle("Messages")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.light)
                .safeAreaBar(edge: .bottom, spacing: 2){}
                .background(.gray50)
                
                FloatingAddButton (
                    action: {},
                    iconImage: "quill-write-01"
                )
                .padding(.trailing, 24)
                .padding(.bottom, 24)
                
                
                
            }
        }
    }
}

private struct FilterChip: View {
    let title: String
    let isSelected: Bool
    var body: some View {
        HStack(spacing: 4) {
            HeadingText(title, fontSize: 13, color: isSelected ? .white : .gray600)
            Circle()
                .frame(width: 5, height: 5)
        }
        .foregroundStyle(isSelected ? .white : .error600)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(isSelected ? Color.primaryButton.gradient : Color.clear.gradient )
                .stroke(isSelected ? .clear : .gray300)
        )
        
    }
}

#Preview {
    MessagesView()
}
