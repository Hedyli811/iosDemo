//
//  StyleExtensions.swift
//  Book
//
//  Created by LI, Hedy on 2025-03-26.
//

 
import SwiftUI

extension Color {
    static let primaryApp = Color.blue
    static let secondaryApp = Color.gray
}

extension Font {
    static func titleStyle() -> Font {
        .system(.body, design: .rounded, weight: .semibold)
    }
    
    static func authorStyle() -> Font {
        .system(.caption, design: .rounded)
    }
}

struct PrimaryButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.primaryApp)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
