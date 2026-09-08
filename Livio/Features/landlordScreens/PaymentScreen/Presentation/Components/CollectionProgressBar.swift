//
//  CollectionProgressBar.swift
//  Livio
//
//  Created by Toluwalase on 01/09/2026.
//

import SwiftUI

struct CollectionProgressBar: View {
    var value: CGFloat // 0...1
    var height: CGFloat = 18

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let clamped = max(0, min(1, value))
            let fillWidth = width * clamped
            let thumbDiameter = height + 8 // a bit larger than the track

            ZStack(alignment: .leading) {
                // Track background
                RoundedRectangle(cornerRadius: height / 2, style: .continuous)
                    .fill(Color.gray100)
                    .overlay(
                        RoundedRectangle(cornerRadius: height / 2, style: .continuous)
                            .stroke(Color.gray300, lineWidth: 1)
                    )
                    .frame(height: height)

                // Striped remainder (unfilled section)
                HStack(spacing: 0) {
                    Color.clear.frame(width: fillWidth)
                    Stripes()
                        .mask(
                            RoundedRectangle(cornerRadius: height / 2, style: .continuous)
                                .frame(height: height)
                        )
                        .foregroundStyle(Color.gray300)
                }
                .frame(height: height)

                // Filled portion
                RoundedRectangle(cornerRadius: height / 2, style: .continuous)
                    .fill(Color.primaryButton.gradient)
                    .frame(width: fillWidth, height: height)

                // Thumb
                Circle()
                    .fill(Color.gray800)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .frame(width: thumbDiameter, height: thumbDiameter)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    .offset(x: max(0, min(width - thumbDiameter, fillWidth - thumbDiameter / 2)),
                            y: -(thumbDiameter - height) / 2)
            }
        }
        .frame(height: height + 10) // extra height to accommodate thumb
        .accessibilityValue(Text("\(Int(value * 100)) percent"))
    }
}

#Preview {
    CollectionProgressBar(value: 0.33)
}

// Simple diagonal stripes shape for the remainder
struct Stripes: View {
    var body: some View {
        GeometryReader { geo in
            let stripeWidth: CGFloat = 8
            let spacing: CGFloat = 6
            let diagonal = sqrt(geo.size.width * geo.size.width + geo.size.height * geo.size.height)
            ZStack {
                ForEach(0..<Int(diagonal / (stripeWidth + spacing)) + 2, id: \.self) { i in
                    Rectangle()
                        .frame(width: stripeWidth)
                        .offset(x: CGFloat(i) * (stripeWidth + spacing) - diagonal / 2)
                }
            }
            .rotationEffect(.degrees(25))
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
            .opacity(0.6)
        }
    }
}


