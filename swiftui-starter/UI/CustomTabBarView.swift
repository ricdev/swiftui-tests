//
//  CustomTabBar.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/5/22.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var currentTab: String
    var bottomEdge: CGFloat

    var body: some View {
        HStack(spacing: 0) {

            ForEach(["icon-field-validation-error", "profile-image-sample"], id: \.self) { image in
                TabButtonView(image: image, currentTab: $currentTab, badge: 33)
            }
        }
        .padding(.top, 15)
        .padding(.bottom, bottomEdge)
        .background(.white)
    }
}

struct TabButtonView: View {

    var image: String
    @Binding var currentTab: String
    @Environment(\.colorScheme) var scheme

    var badge: Int = 0

    var body: some View {
        Button {
            withAnimation { currentTab = image }
        } label: {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35.0, height: 35.0)
                .foregroundColor(currentTab == image ? Color.red : Color.gray.opacity(0.7))
                .overlay(
                    Text("\(badge < 100 ? badge : 99)+")
                        .font(.caption.bold())
                        .foregroundColor(scheme == .dark ? .black : .white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 5)
                        .background(Color.red, in: Capsule())
                        .background(
                            Capsule()
                                .stroke(scheme == .dark ? .black : .white, lineWidth: 4)
                        )
                        .offset(x: 20, y: -5)
                        .opacity(badge == 0 ? 0 : 1), alignment: .topTrailing
                )
                .frame(maxWidth: .infinity)
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(currentTab: .constant(""), bottomEdge: 0)
    }
}
