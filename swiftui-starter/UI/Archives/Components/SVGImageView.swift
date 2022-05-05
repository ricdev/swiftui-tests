//
//  SVGImageView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/18/22.
//

import Combine
import SwiftUI
import WebKit

struct SVGImageView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    let inspection = Inspection<Self>()

    var body: some View {
        content
            .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
    }

    private var content: AnyView {
        switch viewModel.image {
        case .notRequested: return AnyView(notRequestedView)
        case .isLoading: return AnyView(loadingView)
        case let .loaded(image): return AnyView(loadedView(image))
        case let .failed(error): return AnyView(failedView(error))
        }
    }
}

// MARK: - Content

private extension SVGImageView {
    var notRequestedView: some View {
        Text("").onAppear {
            self.viewModel.loadImage()
        }
    }

    var loadingView: some View {
        ActivityIndicatorView()
    }

    func failedView(_: Error) -> some View {
        Text("Unable to load image")
            .font(.footnote)
            .multilineTextAlignment(.center)
            .padding()
    }

    func loadedView(_ image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

// MARK: - ViewModel

extension SVGImageView {
    class ViewModel: ObservableObject {
        // State
        let imageURL: URL
        @Published var image: Loadable<UIImage>

        // Misc
        let container: DIContainer
        private var cancelBag = CancelBag()

        init(container: DIContainer, imageURL: URL, image: Loadable<UIImage> = .notRequested) {
            self.imageURL = imageURL
            _image = .init(initialValue: image)
            self.container = container
        }

        // MARK: - Side Effects

        func loadImage() {
            container.services.imagesService
                .load(image: loadableSubject(\.image), url: imageURL)
        }
    }
}

#if DEBUG
    struct SVGImageView_Previews: PreviewProvider {
        static var previews: some View {
            SVGImageView(viewModel: SVGImageView.ViewModel(
                container: .preview, imageURL: URL(string: "https://flagcdn.com/us.svg")!
            ))
        }
    }
#endif
