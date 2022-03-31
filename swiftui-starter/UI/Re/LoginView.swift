//
//  LoginView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/21/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class FirebaseManager: NSObject {

    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        super.init()
    }
}

struct LoginView: View {

    @State var isLoginMode = false
    @State var image: UIImage?
    @State var email = ""
    @State var password = ""
    @State var loginStatusMessage = ""
    @State var showingImagePicker = false

    struct Header: View {
        var text: String
        let font = FontFamily.BrilliantCutProB7.black.font(size: 12)
        let font2 = FontFamily.BrilliantCutProB7.black.textStyle(.title)

        var body: some View {
            HStack {
                Text(text)
                    .font(font2)
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {

                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Header(text: "Login")
                            .tag(true)
                        Header(text: "Create Account")
                            .tag(false)
                    }
                    .pickerStyle(.segmented)

                    if !isLoginMode {
                        Button {
                            self.showingImagePicker.toggle()
                        } label: {

                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .renderingMode(.original)
                                        .resizable()
                                    
//                                        .aspectRatio(contentMode: .fit)

//
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 128, height: 128, alignment: .center)
//                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.black, lineWidth: 3))
                        }
                    }

                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)

                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)

                    Button {
                        self.handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Login" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 12, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }

                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                }
                .padding()
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
        }.navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $showingImagePicker, onDismiss: nil) {
                ImagePicker(image: $image)
            }
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
        FirebaseManager.shared.auth.signIn(withEmail: self.email, password: self.password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                self.loginStatusMessage = "Failed to login user: \(error)"
                return
            }

            print("user logged in successfully: ", result as Any)
        }
    }

    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: self.email, password: self.password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.loginStatusMessage = "Failed to create user: \(error)"
                return
            }

            print("successfully created user: ", result as Any)

            self.persistImageToStorage()
        }
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
        let userData = ["email": self.email, "uid": uid, "profileImageUrl": profileImageUrl.absoluteString]

        FirebaseManager.shared.firestore.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                print(error)
                self.loginStatusMessage = "\(error)"
                return
            }
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
