//
//  AtlasLoginView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/30/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

// swiftlint:disable line_length
struct AtlasLoginView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var viewModel: AtlasLoginViewModel

    @State private var selection: String?
    @State private var userRequiredAlert = false
    @State private var isLoginMode = true
    @State private var showingImagePicker = false
    @State private var image: UIImage?
    @State private var loginStatusMessage = ""
    @State private var showingUseFaceTouchIDAlert = false
    @State private var showingUseFaceTouchIDNotConfiguredAlert = false
    @State private var showingUseFaceTouchIDNotConfigured2Alert = false
    @State private var showingUseFaceTouchIDVerifiedAlert = false

    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(colorScheme == .light ? Asset.imgButtonBackBlack.name : Asset.imgButtonBack.name)
                    .resizable()
                    .scaledToFill()
            }
        })
    }

    struct Header: View {
        var text: String
        let font = FontFamily.BrilliantCutProB7.regular.font(size: 12)
        let font2 = FontFamily.BrilliantCutProB7.regular.textStyle(.title)

        var body: some View {
            HStack {
                Text(text)
                    .font(font2)
            }
        }
    }

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    ZStack {
                        Text("CNT\nJEWELRY\n\n\n").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.largeTitle)).padding().foregroundColor(.secondaryLabel)
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

                    ZStack {
                        Spacer()
                        VStack(spacing: 30.0 ) {
                            VStack(spacing: 10.0 ) {
                                HStack {
                                    Text("WELCOME").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.title))
                                    Spacer()
                                }

                                Picker(selection: $isLoginMode, label: Text("Picker here")) {
                                    Header(text: "Login")
                                        .tag(true)
                                    Header(text: "Create Account")
                                        .tag(false)
                                }
                                .pickerStyle(.segmented)

                                HStack {
                                    Text(isLoginMode == true ? "Please enter your login details below:" : "Please enter your registration details:").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.body))
                                    Spacer()
                                }
                            }

                            VStack(spacing: 20.0 ) {
                                if !isLoginMode {
                                    Button {
                                        self.showingImagePicker.toggle()
                                    } label: {

                                        VStack {
                                            if let image = self.image {
                                                Image(uiImage: image)
                                                    .renderingMode(.original)
                                                    .resizable()
                                            } else {
                                                Image(systemName: "person.fill")
                                                    .font(.system(size: 64))
                                            }
                                        }
                                        .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.black, lineWidth: 3))
                                    }
                                }
                                EntryField(systemName: "envelope", placeHolder: "Email", prompt: viewModel.emailPrompt, field: $viewModel.email)
                                EntryField(systemName: "lock", placeHolder: "Password", prompt: viewModel.passwordPrompt, field: $viewModel.password, isSecure: true)
                                if isLoginMode == false {
                                    EntryField(systemName: "lock", placeHolder: "Confirm Password", prompt: viewModel.confirmPasswordPrompt, field: $viewModel.confirmPassword, isSecure: true)
                                }
                            }.padding(.bottom, 30.0)

                            Button {
                                self.handleAction()
                            } label: {
                                HStack {
                                    Spacer()
                                    Text(isLoginMode == true ? "Log In".uppercased() : "Register".uppercased())
                                    Spacer()
                                }
                            }
                            .buttonStyle(PrimaryButtonStyle())
                            .disabled(!viewModel.isLoginFormComplete)
                            .padding(.bottom, 60.0)
                            .alert(isPresented: $showingUseFaceTouchIDAlert) {
                                Alert(
                                    title: Text("Use touch/face id?"),
                                    message: Text("Ease login process by using touch/face id?"),
                                    primaryButton: .destructive(Text("Yes")) {
                                        self.loginUsingV2()
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            .alert("Face ID/Touch ID may not be configured.", isPresented: $showingUseFaceTouchIDNotConfiguredAlert) {
                                Button("OK", role: .cancel) { }
                            }
                            .alert("Face ID/Touch ID may not be configured.", isPresented: $showingUseFaceTouchIDNotConfigured2Alert) {
                                Button("OK", role: .cancel) { }
                            }
                            .alert("Verified", isPresented: $showingUseFaceTouchIDVerifiedAlert) {
                                Button("OK", role: .cancel) { }
                            }
                        }
                        .padding()
                    }

                    NavigationLink(destination: AtlasLoginView(viewModel: AtlasLoginViewModel()), tag: IntroViewModel.LoginTypes.atlas.rawValue, selection: $selection) { EmptyView() }
                    NavigationLink(destination: AtlasLoginView(viewModel: AtlasLoginViewModel()), tag: IntroViewModel.LoginTypes.faceTouch.rawValue, selection: $selection) { EmptyView() }
                }

            }
            .edgesIgnoringSafeArea([.top, .bottom])
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            .background(Color.systemBackground.colorInvert())
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $showingImagePicker, onDismiss: nil) {
                ImagePicker(image: $image)
            }
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

extension AtlasLoginView {

    func loginUsingV2() {
//        BiometricsV2.shared.canEvaluate { (canEvaluate, _, _) in
//            guard canEvaluate else {
//                self.showingUseFaceTouchIDNotConfiguredAlert.toggle()
//                return
//            }
//
//            BiometricsV2.shared.evaluate { [self] (success, _) in
//                guard success else {
//                    showingUseFaceTouchIDNotConfigured2Alert.toggle()
//                    return
//                }
//
//                showingUseFaceTouchIDVerifiedAlert.toggle()
//            }
//        }
    }

    private func handleAction() {
        if isLoginMode {
            loginUser()
            print("Log in Firebase using an existing account")
        } else {
            createNewAccount()
            print("Register to Firebase")
        }
    }

    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: self.viewModel.email, password: self.viewModel.password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                self.loginStatusMessage = "Failed to login user: \(error)"
                return
            }

            print("user logged in successfully: ", result as Any)
            self.redirectToLandingView()

            self.useTouchFaceID()
        }
    }

    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: self.viewModel.email, password: self.viewModel.password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.loginStatusMessage = "Failed to create user: \(error)"
                return
            }

            print("successfully created user: ", result as Any)
            self.persistImageToStorage()
            self.redirectToLandingView()

            self.useTouchFaceID()
        }
    }

    private func useTouchFaceID() {
        UserDefaults.standard.set(self.viewModel.email, forKey: "usernameKey")
        UserDefaults.standard.set(self.viewModel.password, forKey: "passwordKey")

        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        saveToken(token: uid)
//        let hasLoginKey = UserDefaults.standard.bool(forKey: "hasLoginKey")
//        self.showingUseFaceTouchIDAlert.toggle()
//        self.loginUsingV2()
    }

    private func persistImageToStorage() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)

        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                self.loginStatusMessage = "Failed to upload image: \(error)"
                return
            }

            ref.downloadURL { url, error in
                if let error = error {
                    self.loginStatusMessage = "Failed to retrieve the profile image url: \(error)"
                    return
                }

                self.loginStatusMessage = "profile image was successfully stored: \(url?.absoluteString ?? "" )"
                print(self.loginStatusMessage)

                guard let url = url else { return }
                self.storeUserProfileImageUrl(profileImageUrl: url)
            }
        }
    }

    private func storeUserProfileImageUrl(profileImageUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": self.viewModel.email, "uid": uid, "profileImageUrl": profileImageUrl.absoluteString]

        FirebaseManager.shared.firestore.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                print(error)
                self.loginStatusMessage = "\(error)"
                return
            }
        }
    }

    func saveToken(token: String) {

        // encrypt
        let data = HasherAESGCM.shared.enryptString(token)

        // save to local
        UserDefaults.standard.set(data, forKey: "loginKey")
        UserDefaults.standard.set(true, forKey: "hasLoginKey")
    }

    func loadToken() {

//        // get local data
//        let defaults = UserDefaults.standard
//        let loginKeyData = defaults.object(forKey: "loginKey") as? Data
//
//        // Note: works only stored strings, bool etc.
//        // let loginKeyData = UserDefaults.standard.data(forKey: "loginKey")
//
//        guard let loginKeyData = loginKeyData else {
//            self.alert(title: "Failed.", message: "Failed to load token.", okActionTitle: "Continue")
//            self.lblTitle.text = "Failed. \nTap to try again."
//            return
//        }
//
//        // decrypt
//        let decryptedData: String? = HasherAESGCM.shared.decrypt(data: loginKeyData)
//
//        guard let decryptedData = decryptedData else {
//            self.alert(title: "Failed.", message: "Failed to load token.", okActionTitle: "Continue")
//            self.lblTitle.text = "Failed. \nTap to try again."
//            return
//        }
//
//        self.alert(title: "Success.", message: "Token: \(decryptedData)", okActionTitle: "Continue")
//        self.lblTitle.text = "Success. \nTap to try again."
    }
}
