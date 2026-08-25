//
//  HeroImageView.swift
//  Livio
//
//  Created by Toluwalase on 25/08/2026.
//

import SwiftUI

struct HeroImageView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HeadingText("Hero Image", fontSize: 15, fontWeight: .medium)
            Divider()
                .padding(.top, 8)
                .padding(.bottom, 12)
            
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    HeadingText("Click to upload photo", fontSize: 15)
                    HeadingText("PNG, JPG or WEBP (Max. 5MB)", fontSize: 15, fontWeight: .regular, color: .gray800)
                }
                
                Spacer()
                
                Image("camera-add-02")
                    .padding(8)
                    .background(
                        Circle()
                            .fill(.primaryButton)
                    )
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray200)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray300, style: StrokeStyle(lineWidth: 1, dash: [6, 4]))
            )
            
            HStack{
                Image("property")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                Spacer()
                Image("property")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
                Spacer()
                
                Image("property")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
            }
            .padding(.top, 12)
            .padding(.bottom, 12)
            
            HStack(alignment: .center){
                Image(systemName: "exclamationmark.circle")
                    .foregroundStyle(.goldenrod700)
                    .font(.system(size: 24))
                
                HeadingText("High-quality images increase tenant inquiry rates by up to 40%. \nWe recommend professional wide-angle shots.", fontSize: 13, color: .warning600)
//                    .lineLimit(2)
//                    .minimumScaleFactor(0.5)
                    .lineHeight(.leading(increase: 8))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
                
                
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.orange400.opacity(0.15))
                    .stroke(.orange400.opacity(0.50), lineWidth: 1)
            )
            
        }
    }
}

#Preview {
    HeroImageView()
}
