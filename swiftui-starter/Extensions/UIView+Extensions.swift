//
//  UIView+Extensions.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/10/22.
//

import SwiftUI

extension View {
    
    func addBadge(alignment: Alignment = .topTrailing, imageName: String = "checkmark.circle.fill", xOffset: CGFloat = 3, yOffset: CGFloat = -3) -> some View {
        ZStack(alignment: alignment) {
            self
            
            Image(systemName: imageName).offset(x: xOffset, y: yOffset)
        }
    }
    
    func roundedCorner(cornerRadius: CGFloat = 8) -> some View {
        self
        .background(Color(UIColor.systemBackground))
        .padding(.all)
        .cornerRadius(cornerRadius)
    }
}
