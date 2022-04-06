//
//  HomeView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/5/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {

}

struct HomeView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme

//    @ObservedObject var viewModel: HomeViewModel
    @State private var currentTab = "icon-field-validation-error"
    var bottomEdge: CGFloat

    init(bottomEdge: CGFloat) {
        self.bottomEdge = bottomEdge
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        TabView(selection: $currentTab) {
            
            Text("icon-field-validation-error")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary.opacity(0.05))
                .tag("icon-field-validation-error")
                .scaledFont(name: "Georgia", size: 12)
            Text("profile-image-sample")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary.opacity(0.05))
                .tag("profile-image-sample")
        }.overlay(CustomTabBarView(currentTab: $currentTab, bottomEdge: bottomEdge), alignment: .bottom )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HomeView(bottomEdge: 0).preferredColorScheme($0)
        }
    }
}
