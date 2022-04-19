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

    @State var hideBar = false

    init(bottomEdge: CGFloat) {
        self.bottomEdge = bottomEdge
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        TabView(selection: $currentTab) {
//            Text("icon-field-validation-error")
            LandingView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary.opacity(0.05))
                .tag("icon-field-validation-error")
                .scaledFont(name: "Georgia", size: 12)
            Text("icon-black-add-takeaway")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary.opacity(0.05))
                .tag("icon-black-add-takeaway")
        }.overlay(

            VStack {
                // FAB View
//                Button {
//                } label: {
//                    HStack(spacing: 10) {
//                        Image(systemName: "pencil")
//                            .font(.title)
//
//                        Text("Compose")
//                            .fontWeight(.semibold)
//                    }
//                    .foregroundColor(Color("Pink"))
//                    .padding(.vertical, 12)
//                    .padding(.horizontal)
//                    .background(AppColor.gray.toColor(), in: Capsule())
//                    .shadow(color: .primary.opacity(0.06), radius: 5, x: 5, y: 10)
//                }
//                .padding(.trailing)
//                .offset(y: -15)
//                .frame(maxWidth: .infinity, alignment: .trailing)
//                .opacity(currentTab  == "Mail" ? 1 : 0)
//                .animation(.none, value: currentTab)

                // Tab View
                CustomTabBarView(currentTab: $currentTab, bottomEdge: bottomEdge)

            }, alignment: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HomeView(bottomEdge: 0).preferredColorScheme($0)
        }
    }
}
