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

    @State private var messageText = ""

    private let chatMessages: [ChatMessage] = [
        ChatMessage(
            sender: .other,
            text: """
            Hi! I was checking the portal and noticed my lease is up for renewal in two months. I’d love to stay in Unit 208 for another year. Is the rate staying the same?
            """,
            time: "2:18pm"
        ),

        ChatMessage(
            sender: .me,
            audioDuration: "0:55",
            time: "2:19pm"
        ),

        ChatMessage(
            sender: .other,
            text: """
            That sounds fair, thank you! Also, just a quick follow-up on the kitchen sink faucet—the maintenance crew came by yesterday, but it's still dripping a bit. Could someone take another look?
            """,
            time: "2:23pm"
        ),

        ChatMessage(
            sender: .me,
            text: """
            Oh, I'm sorry to hear that. I'll flag this to the lead technician immediately. Would 2:00 PM today work for a re-inspection?
            """,
            time: "3:56pm"
        )
    ]

    var body: some View {
        VStack(spacing: 0) {

            chatHeader

            Divider()
                .background(Color.gray300)

            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {

                    VStack(spacing: 0) {

                        Text("Today")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(Color.gray500)
                            .padding(.top, 208)
                            .padding(.bottom, 90)

                        VStack(spacing: 32) {
                            ForEach(chatMessages) { chatMessage in
                                ChatMessageRow(
                                    chatMessage: chatMessage,
                                    avatarImageName: message.avatarImageName
                                )
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .background(Color.gray50)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            composer
        }
    }

    // MARK: - Header

    private var chatHeader: some View {
        HStack(spacing: 0) {

            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 21, weight: .medium))
                    .foregroundStyle(Color.gray950)
                    .frame(width: 48, height: 48)
                    .background(
                        Circle()
                            .fill(Color.white)
                    )
            }

            Spacer()
                .frame(width: 16)

            if let imageName = message.avatarImageName {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }

            Spacer()
                .frame(width: 12)

            VStack(alignment: .leading, spacing: 3) {

                Text(message.senderName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color.gray950)

                HStack(spacing: 8) {

                    Text(message.timestamp)
                        .font(.system(size: 13))
                        .foregroundStyle(Color.gray500)

                    Text(message.subtitle)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.gray50)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(Color.gray950)
                        )
                }
            }

            Spacer()

            Button {
                // Call action
            } label: {
                Image(systemName: "phone")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.gray600)
                    .frame(width: 44, height: 44)
            }

            Button {
                // More action
            } label: {
                Image( "more-vertical")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(Color.gray600)
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background(Color.white)
    }

    // MARK: - Composer

    private var composer: some View {
        HStack(spacing: 10) {

            Button {
                // Attachment action
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.gray600)
                    .frame(width: 46, height: 46)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray300, lineWidth: 1)
                            )
                    )
            }

            HStack(spacing: 10) {

                TextField(
                    "Type a message...",
                    text: $messageText
                )
                .font(.system(size: 16))
                .foregroundStyle(Color.gray950)
                .tint(Color.gray600)
                .colorScheme(.light)
                .padding(.leading, 18)
                .padding(.trailing, 5)
                .frame(height: 58)
                .background(
                    Capsule()
                        .fill(Color.white)
                        .stroke(Color.gray300)
                )

                

                Button {
                    // Voice recording
                } label: {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 19, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 46, height: 46)
                        .background(
                            Circle()
                                .fill(Color.gray950)
                        )
                }
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 8)
        .background(Color.gray50)
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
