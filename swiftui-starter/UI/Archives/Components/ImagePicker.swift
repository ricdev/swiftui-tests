//
//  imagePicker.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = PHPickerViewController

    @Binding var image: UIImage?

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parentImagePicker: ImagePicker

        init(_ parentImagePicker: ImagePicker) {
            self.parentImagePicker = parentImagePicker
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parentImagePicker.image = image as? UIImage
                }
            }
        }
    }

    func makeUIViewController(context: Self.Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_: PHPickerViewController, context _: Self.Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
