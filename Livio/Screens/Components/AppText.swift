//
//  AppText.swift
//  Livio
//
//  Created by Toluwalase on 08/08/2026.
//

import SwiftUI



struct HeadingText:  View {
    var text: String
    var fontSize: CGFloat
    
    
    init(_ title: String,fontSize: CGFloat = 23) {
        self.text =  title
        self.fontSize = fontSize
        
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .fontWeight(.medium)
    }
}

struct RegularText:  View {
    var text: String
    var color: Color
    var fontSize: CGFloat
    
    init(_ title: String, color: Color? = nil, fontSize: CGFloat = 15) {
        self.text = title
        self.color = color ?? .greu600
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

