//
//  ProfileVEIW.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import SwiftUI
import Combine

struct Employee {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}

struct ProfileView: View {
    @State private var image: Image?
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false

    var employee: Employee

    struct ProfilePicture: View {
        var imageName: String

        var body: some View {
            AsyncImage(url: URL(string: imageName)!,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() })
               .clipShape(Circle())
               .scaledToFill()
               .frame(width: 100, height: 100)
               .clipped()
        }
    }

    struct EmailAddress: View {
        var address: String

        var body: some View {
            HStack {
                Image(systemName: "envelope")
                Text(address)
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            ProfilePicture(imageName: employee.profilePicture)
            Text(employee.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text(employee.jobTitle)
                .foregroundColor(.secondary)
            EmailAddress(address: employee.emailAddress)

            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $selectedImage)
        }
        .onChange(of: selectedImage) { _ in loadImage()

        }
    }

    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct ProfileView_Previews: PreviewProvider {

    // swiftlint:disable line_length
    static var previews: some View {
        ProfileView(employee: Employee(name: "John Doe", jobTitle: "Agent 007", emailAddress: "agent007@brittishintelligence.com", profilePicture: "https://raw.githubusercontent.com/ricdev/swiftui-tests/main/image.jpeg"))
    }
}
