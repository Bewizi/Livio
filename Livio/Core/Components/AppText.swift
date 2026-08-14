//
//  AppText.swift
//  Livio
//
//  Created by Toluwalase on 08/08/2026.
//

import SwiftUI



struct HeadingText: View {
    // Optional content pieces
    private var text: String?
    private var title: Text?

    // Style
    private var fontSize: CGFloat
    private var fontWeight: Font.Weight
    private var color: Color

    // Designated initializer with optionals so existing code can omit either
    init(
        _ text: String? = nil,
        title: Text? = nil,
        fontSize: CGFloat = 23,
        fontWeight: Font.Weight = .medium,
        color: Color? = nil
    ) {
        self.text = text
        self.title = title
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.color = color ?? .gray950
    }

    // Convenience: init with just String
    init(
        _ text: String,
        fontSize: CGFloat = 23,
        fontWeight: Font.Weight = .medium,
        color: Color? = nil
    ) {
        self.init(text, title: nil, fontSize: fontSize, fontWeight: fontWeight, color: color)
    }

    // Convenience: init with just Text title
    init(
        title: Text,
        fontSize: CGFloat = 23,
        fontWeight: Font.Weight = .medium,
        color: Color? = nil
    ) {
        self.init(nil, title: title, fontSize: fontSize, fontWeight: fontWeight, color: color)
    }

    var body: some View {
        
        Group {
            if let text, let title {
                HStack(spacing: 4) {
                    Text(text)
                    title
                }
            } else if let text {
                Text(text)
            } else if let title {
                title
            } else {
                EmptyView()
            }
        }
        .font(.system(size: fontSize))
        .fontWeight(fontWeight)
        .foregroundStyle(color)
    }
}

struct RegularText:  View {
    var text: String
    var color: Color
    var fontSize: CGFloat
    
    init(_ title: String, color: Color? = nil, fontSize: CGFloat = 15) {
        self.text = title
        self.color = color ?? .gray600
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .fontWeight(.regular)
            .foregroundStyle(color)
    }
}

struct TextFieldText: View {
    var text: String
    
    init(_ title: String) {
        self.text = title
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 15))
            .fontWeight(.medium)
            .foregroundStyle(.gray950)
    }
}

