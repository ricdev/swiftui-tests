//
//  LoginOptionsView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/22/22.
//

import SwiftUI
import Combine

class LoginOptionViewModel: ObservableObject {

    enum LoginTypes {
        case atlas
        case faceTouch
    }

    @Published var selectedLoginType: LoginTypes?

    func setLoginOption(selectedLoginType: LoginTypes) {
        self.selectedLoginType = selectedLoginType
        print("selected: ", selectedLoginType)
    }
}

class AtlasLoginFormViewModel: ObservableObject {
//    @Published
}

struct AtlasLoginFormView: View {

    var body: some View {
        VStack(spacing: 16) {
            Button {
//                print(self.$selectedLoginType)
//                self.selectedLoginType = nil
            } label: {
                HStack {
                    Spacer()
                    Text("atlas")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .font(.system(size: 12, weight: .semibold))
                    Spacer()
                }.background(Color.blue)
            }
        }
    }
}

struct LoginOptionView: View {

    @StateObject var viewModel: LoginOptionViewModel
    @Binding var selected: LoginOptionViewModel.LoginTypes?

    var body: some View {

        VStack(spacing: 16) {
            Button {
                self.viewModel.setLoginOption(selectedLoginType: .atlas)
                self.selected = self.viewModel.selectedLoginType
            } label: {
                HStack {
                    Spacer()
                    Text("ATLAS LOGIN")
                    Spacer()
                }
            }.buttonStyle(RedButtonStyle())

            Button {
                self.viewModel.setLoginOption(selectedLoginType: .faceTouch)
                self.selected = self.viewModel.selectedLoginType

            } label: {
                HStack {
                    Spacer()
                    Text("FACE/TOUCH ID LOGIN")
                    Spacer()
                }
            }.buttonStyle(RedButtonStyle())
        }.onAppear {
            print("Appear")
        }.onDisappear {
            print("Disappear")
        }
    }
}

class LoginOptionsViewModel: ObservableObject {
}

struct LoginOptionsView: View {

    @State var viewModel: LoginOptionsViewModel?
    @State var selectedLoginType: LoginOptionViewModel.LoginTypes?

    @State var showSuccessToast: Bool = false
    @State var showInformationToast: Bool = false
    @State var showErrorToast: Bool = false
    @State var showWarningToast: Bool = false
    @State var showLightToast: Bool = false
    @State var showDarkToast: Bool = false

    init() {
        self.viewModel = LoginOptionsViewModel()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {

                    if self.selectedLoginType == nil {
                        LoginOptionView(viewModel: LoginOptionViewModel(), selected: self.$selectedLoginType)
                    }

                    if self.selectedLoginType == LoginOptionViewModel.LoginTypes.atlas {

                        AtlasLoginFormView()

//                        Button {
//                            print(self.$selectedLoginType)
//                            self.selectedLoginType = nil
//                        } label: {
//                            HStack {
//                                Spacer()
//                                Text("atlas")
//                                    .foregroundColor(.white)
//                                    .padding(.vertical, 10)
//                                    .font(.system(size: 12, weight: .semibold))
//                                Spacer()
//                            }.background(Color.blue)
//                        }
                    }

                    if self.selectedLoginType == LoginOptionViewModel.LoginTypes.faceTouch {
                        Button {
                            print(self.$selectedLoginType)
                            self.selectedLoginType = nil
                            self.showSuccessToast.toggle()
                        } label: {
                            HStack {
                                Spacer()
                                Text("faceTouch")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 12, weight: .semibold))
                                Spacer()
                            }.background(Color.blue)
                        }
                    }

                }
                .padding()
            }
            .navigationTitle("Test controls")
            .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .toast(isShowing: $showSuccessToast, type: .error(message: "Success Message"))
        .toast(isShowing: $showInformationToast, type: .success(message: "Information Message"))
        .toast(isShowing: $showErrorToast, type: .warning(message: "Error Message"))
        .toast(isShowing: $showWarningToast, type: .error(message: "Warning Message"))
        .toast(isShowing: $showLightToast, type: .success(message: "Light Message"))
        .toast(isShowing: $showDarkToast, type: .warning(message: "Dark Message"))
    }
}

struct LoginOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOptionsView()
    }
}
