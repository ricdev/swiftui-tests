//
//  IntroView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/30/22.
//

import SwiftUI

// swiftlint:disable line_length
struct IntroView: View {

    @StateObject var viewModel: IntroViewModel
    @State private var selection: String?
    @State private var userRequiredAlert = false
    @State private var showModal: Bool = false

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ZStack {
                        Text("CNT\nJEWELRY\n\n\n\n").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.largeTitle)).padding()
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

                    VStack(spacing: 20.0 ) {

                        VStack(spacing: 10.0 ) {
                            HStack {
                                Text("WELCOME").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.title3))
                                Spacer()
                            }
                            HStack {
                                Text("Please select how you wish to login:").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.body))
                                Spacer()
                            }
                        }

                        Button {
                            self.viewModel.setLoginOption(selectedLoginType: .atlas)
                            self.selection = self.$viewModel.selectedLoginType.wrappedValue?.rawValue
                        } label: {
                            HStack {
                                Spacer()
                                Text("ATLAS LOGIN / REGISTRATION")
                                Spacer()
                            }
                        }.buttonStyle(TheRedButtonStyle())

                        Button {
//                                self.viewModel.setLoginOption(selectedLoginType: .faceTouch)
//                                self.selection = self.$viewModel.selectedLoginType.wrappedValue?.rawValue
                            // todo: check if has logged in user
                            // todo: check if touch/face id was activated
                            // todo: show face/touch modal
                            self.userRequiredAlert = true
                        } label: {
                            HStack {
                                Spacer()
                                Text("FACE / TOUCH ID LOGIN")
                                Spacer()
                            }
                        }
                        .buttonStyle(TheRedButtonStyle())
                        .alert(isPresented: $userRequiredAlert) {
                            Alert(
                                title: Text("User not found."),
                                message: Text("This feature requires an active user. Kindly login or register first."),
                                dismissButton: Alert.Button.cancel(
                                    Text("Ok"), action: {
                                        print("Cancelled")
                                        self.userRequiredAlert = false
                                        self.showModal.toggle()
                                    })
                            )
                        }
                    }
                    .padding(.bottom, 60.0)
                    .padding([.leading, .trailing], 20.0)

                    NavigationLink(destination: AtlasLoginView(viewModel: AtlasLoginViewModel()), tag: IntroViewModel.LoginTypes.atlas.rawValue, selection: $selection) { EmptyView() }
                    NavigationLink(destination: AtlasLoginView(viewModel: AtlasLoginViewModel()), tag: IntroViewModel.LoginTypes.faceTouch.rawValue, selection: $selection) { EmptyView() }
                }
            }.background(.red)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
            .overlay(ModalView(showModal: $showModal))
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            IntroView(viewModel: IntroViewModel()).preferredColorScheme($0)
        }
    }
}
