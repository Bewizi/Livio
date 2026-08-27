//
//  ChatView.swift
//  Livio
//
//  Created by Toluwalase on 27/08/2026.
//

import SwiftUI

struct ChatView: View {
    let message: MessageData
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            Divider().background(.gray300)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Today")
                        .font(.system(size: 13))
                        .foregroundStyle(.gray500)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 8)

                    Text(message.preview)
                        .font(.system(size: 15))
                        .foregroundStyle(.gray950)
                }
                .padding(.horizontal, 20)
            }

            HStack(spacing: 12) {
                Image(systemName: "plus")
                    .foregroundStyle(.gray500)
                TextField("Type a message...", text: .constant(""))
                    .font(.system(size: 15))
                Image(systemName: "mic.fill")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(Circle().fill(.gray950))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.white)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 8) {
                    Button {
                        dismiss()   // ← wire this back up, it was a no-op
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.gray950)
                    }

                    if let imageName = message.avatarImageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(message.senderName)
                            .font(.system(size: 15, weight: .semibold))
                        HStack(spacing: 6) {
                            Text(message.timestamp)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray500)
                            Text(message.subtitle)
                                .font(.system(size: 11, weight: .medium))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(Capsule().fill(.gray950))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Image(systemName: "phone")
                Image(systemName: "ellipsis")
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatView(message: MessageData(
            senderName: "Elena Rochukwu",
            subtitle: "Unit 208",
            subtitleColor: .goldenrod500,
            preview: "The kitchen sink is still leaking after the repair attempt yesterday...",
            timestamp: "1hr ago",
            isUnread: false,
            avatarImageName: "user"
        ))
    }
}
