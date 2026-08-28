//
//  ChatRow.swift
//  Livio
//
//  Created by Toluwalase on 27/08/2026.
//

import SwiftUI

enum ChatMessageSender {
    case me
    case other
}

struct ChatMessage: Identifiable {
    let id = UUID()

    let sender: ChatMessageSender
    var text: String? = nil
    var audioDuration: String? = nil
    let time: String
}

struct ChatMessageRow: View {

    let chatMessage: ChatMessage
    let avatarImageName: String?

    var body: some View {

        HStack(
            alignment: .top,
            spacing: 12
        ) {

            if chatMessage.sender == .other {

                avatar

                VStack(
                    alignment: .leading,
                    spacing: 5
                ) {

                    Text("Elena Rochukwu")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color.goldenrod500)
                    

                    if let text = chatMessage.text {
                        Text(text)
                            .font(.system(size: 16))
                            .foregroundStyle(Color.gray700)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        
                    }

                    if let duration = chatMessage.audioDuration {
                        audioMessage(duration: duration)
                    }
                }

                Spacer(minLength: 20)

            } else {

                Spacer(minLength: 45)

                VStack(
                    alignment: .leading,
                    spacing: 5
                ) {

                    HStack(spacing: 12){
                        avatar
                        Text("Chidera Nwachukwu")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(.gray950)
                    }
                    .padding(.bottom, 8)
                    
                    if let text = chatMessage.text {
                        Text(text)
                            .font(.system(size: 16))
                            .foregroundStyle(Color.gray700)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    if let duration = chatMessage.audioDuration {
                        audioMessage(duration: duration)
                    }

                    HStack(spacing: 5) {
                        Text(chatMessage.time)
                            .font(.system(size: 12))
                            .foregroundStyle(Color.gray500)

                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Color.gray600)
                    }
                }

                Spacer(minLength: 0)
            }
        }
    }
    
    

    private var avatar: some View {

        Group {
            if let imageName = avatarImageName {

                Image(imageName)
                    .resizable()
                    .scaledToFill()

            } else {

                Circle()
                    .fill(Color.gray300)
            }
        }
        .frame(width: 30, height: 30)
        .clipShape(Circle())
    }

    private func audioMessage(duration: String) -> some View {

        VStack(alignment: .leading) {
            
            
            
            
            HStack(spacing: 12) {
                
                Button {
                    // Play/pause audio
                } label: {
                    Image(systemName: "pause.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(Color.gray950)
                        .frame(width: 32, height: 32)
                }
                
                WaveformView()
                
                Text(duration)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.gray600)
            }
            .padding(.horizontal, 14)
            .frame(height: 68)
            .background(
                Capsule()
                    .fill(Color.white)
            )
        }
    }
}

#Preview{
    ChatMessageRow(chatMessage: ChatMessage(sender: .me, time: "Now"), avatarImageName: "user")
}

struct WaveformView: View {

    private let bars: [CGFloat] = [
        15, 26, 34, 22, 42, 28, 48, 20,
        38, 30, 45, 25, 36, 20, 44, 28,
        48, 24, 40, 30, 20, 42, 27, 36,
        21, 43, 29, 38, 24, 44, 20, 32
    ]

    var body: some View {

        HStack(
            alignment: .center,
            spacing: 3
        ) {

            ForEach(
                Array(bars.enumerated()),
                id: \.offset
            ) { index, height in

                RoundedRectangle(cornerRadius: 2)
                    .fill(
                        index < 9
                            ? Color.goldenrod500
                            : Color.gray500
                    )
                    .frame(
                        width: 2,
                        height: height
                    )
            }
        }
        .frame(maxWidth: .infinity)
    }
}
