//
//  AtlasLoginView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/30/22.
//

import SwiftUI

class AtlasLoginViewModel: ObservableObject {

    enum LoginTypes: String {
        case atlas
        case faceTouch
    }

    @Published var selectedLoginType: LoginTypes?

    func setLoginOption(selectedLoginType: LoginTypes) {
        self.selectedLoginType = selectedLoginType
        print("selected: ", selectedLoginType)
    }
}

// swiftlint:disable line_length
struct AtlasLoginView: View {

    @StateObject var viewModel: AtlasLoginViewModel
    @State private var selection: String?

    @State private var userRequiredAlert = false

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ZStack {
                        Text("CNT\nJEWELRY\n\n\n\n").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.largeTitle)).padding()
                        HStack {
                            Image(Asset.imgLoginArtifact1.name)
                                .resizable()
                                .scaledToFill()
                            Spacer()
                        }
                        .frame(height: 230.0)
                        VStack {
                            HStack {
                                Spacer()
                                Image(Asset.imgLoginArtifact2.name)
                                    .resizable()
                                    .frame(width: 212.0, height: 252.0)
                            }
                        }
                    }
                    Spacer()

                    VStack(spacing: 30.0 ) {
                        VStack(spacing: 10.0 ) {
                            HStack {
                                Text("WELCOME").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.title))
                                Spacer()
                            }
                            HStack {
                                Text("Please select how you wish to login:").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.body))
                                Spacer()
                            }
                        }

                        VStack(spacing: 20.0 ) {
                            Button {
                                self.viewModel.setLoginOption(selectedLoginType: .atlas)
                                self.selection = self.$viewModel.selectedLoginType.wrappedValue?.rawValue
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("ATLAS LOGIN / REGISTRATION")
                                    Spacer()
                                }
                            }.buttonStyle(RedButtonStyle())

                            Button {
                                self.viewModel.setLoginOption(selectedLoginType: .faceTouch)
                                self.selection = self.$viewModel.selectedLoginType.wrappedValue?.rawValue

                            } label: {
                                HStack {
                                    Spacer()
                                    Text("FACE / TOUCH ID LOGIN")
                                    Spacer()
                                }
                            }.buttonStyle(RedButtonStyle())
                        }.padding(.bottom, 60.0)
                    }
                    .padding()

                    NavigationLink(destination: AtlasLoginView(viewModel: AtlasLoginViewModel()), tag: IntroViewModel.LoginTypes.atlas.rawValue, selection: $selection) { EmptyView() }
                    NavigationLink(destination: AtlasLoginView(viewModel: AtlasLoginViewModel()), tag: IntroViewModel.LoginTypes.faceTouch.rawValue, selection: $selection) { EmptyView() }
                }
            }.background(.red)
            .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}

struct AtlasLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            AtlasLoginView(viewModel: AtlasLoginViewModel()).preferredColorScheme($0)
        }
    }
}
