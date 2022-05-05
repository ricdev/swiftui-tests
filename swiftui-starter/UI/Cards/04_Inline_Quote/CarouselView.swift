//
//  InlineCarousel.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 5/4/22.
//

import SwiftUI

// swiftlint:disable line_length
struct CarouselView: View {

    @GestureState private var dragState = DragState.inactive
    @State var carouselLocation = 0

    var itemHeight: CGFloat
    var views: [AnyView]

    private func onDragEnded(drag: DragGesture.Value) {
        print("drag completed")
        let dragThreshold: CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold {
            carouselLocation -= 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold) {
            carouselLocation += 1
        }
    }

    var body: some View {
        ZStack {
            VStack {
                Text("\(dragState.translation.width)")
                Text("Carousel Location = \(carouselLocation)")
                Text("Relative Location = \(relativeLoc())")
                Text("\(relativeLoc()) / \(views.count-1)")
                Spacer()
            }.hidden()
            VStack {
                ZStack {
                    ForEach(0..<views.count, id: \.self) { item in
                        VStack {
                            Spacer()
                            // Text("\(i)")
                            self.views[item]
                            .frame(width: 300, height: self.getHeight(item))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            .background(Color.white)
                            .cornerRadius(10)
//                            .shadow(radius: 3)
                            .opacity(self.getOpacity(item))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            .offset(x: self.getOffset(item))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            
                            Spacer()
                        }
                    }
                }.gesture(
                    DragGesture().updating($dragState) { drag, state, _ in
                            state = .dragging(translation: drag.translation)
                    }
                    .onEnded(onDragEnded)
                )

                Spacer()
            }

            if views.count > 1 {
                VStack {
                    Spacer()

                    HStack(spacing: 2) {
                        Text("\(relativeLoc() + 1) / \(views.count)").padding()
                    }
                    .padding()

                    HStack(spacing: 20) {
                        ForEach((0..<views.count), id: \.self) { index in
                            Circle()
                                .strokeBorder(index == relativeLoc() ? Color.primary : Color.systemGray.opacity(0.5), lineWidth: 2)
                                .background(Circle().fill(index == relativeLoc() ? Color.primary : Color.systemGray.opacity(0.0)))
                                .frame(width: 20, height: 20)
                            }
                    }
                    .padding()

                    HStack(spacing: 2) {
                        ForEach((0..<views.count), id: \.self) { index in
                            Rectangle()
                                .fill(index == relativeLoc() ? Color.purple : Color.purple.opacity(0.5))
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding()

                    HStack(spacing: 2) {
                        ForEach((0..<views.count), id: \.self) { index in
                            Rectangle()
                                .fill(index == relativeLoc() ? Color.purple : Color.purple.opacity(0.5))
                                .frame(width: 30, height: 5)
                        }
                    }
                    .padding()

                    HStack(spacing: 2) {
                        ForEach((0..<views.count), id: \.self) { index in
                            Rectangle()
                                .fill(index == relativeLoc() ? Color.purple : Color.purple.opacity(0.5))
                                .frame(height: 5)
                        }
                    }
                    .padding()

                    Spacer()
                }
                .hidden()
            }
        }
    }

    func relativeLoc() -> Int {
        return ((views.count * 10000) + carouselLocation) % views.count
    }

    func getHeight(_ item: Int) -> CGFloat {
        if item == relativeLoc() {
            return itemHeight
        } else {
            return itemHeight - 100
        }
    }

    func getOpacity(_ item: Int) -> Double {
        if item == relativeLoc()
            || item + 1 == relativeLoc()
            || item - 1 == relativeLoc()
            || item + 2 == relativeLoc()
            || item - 2 == relativeLoc()
            || (item + 1) - views.count == relativeLoc()
            || (item - 1) + views.count == relativeLoc()
            || (item + 2) - views.count == relativeLoc()
            || (item - 2) + views.count == relativeLoc() {
            return 1
        } else {
            return 0
        }
    }

    func getOffset(_ item: Int) -> CGFloat {

        // This sets up the central offset
        if (item) == relativeLoc() {
            // Set offset of cental
            return self.dragState.translation.width
            // These set up the offset +/- 1
        } else if (item) == relativeLoc() + 1 || (relativeLoc() == views.count - 1 && item == 0) {
            // Set offset +1
            return self.dragState.translation.width + (300 + 20)
        } else if (item) == relativeLoc() - 1 || (relativeLoc() == 0 && (item) == views.count - 1) {
            // Set offset -1
            return self.dragState.translation.width - (300 + 20)
            // These set up the offset +/- 2
        } else if (item) == relativeLoc() + 2 || (relativeLoc() == views.count-1 && item == 1) || (relativeLoc() == views.count-2 && item == 0) {
            return self.dragState.translation.width + (2*(300 + 20))
        } else if (item) == relativeLoc() - 2 || (relativeLoc() == 1 && item == views.count-1) || (relativeLoc() == 0 && item == views.count-2) {
            // Set offset -2
            return self.dragState.translation.width - (2*(300 + 20))
        } else if (item) == relativeLoc() + 3 || (relativeLoc() == views.count-1 && item == 2) || (relativeLoc() == views.count-2 && item == 1) || (relativeLoc() == views.count-3 && item == 0) {
            // These set up the offset +/- 3
            return self.dragState.translation.width + (3*(300 + 20))
        } else if (item) == relativeLoc() - 3 || (relativeLoc() == 2 && item == views.count-1) || (relativeLoc() == 1 && item == views.count-2) || (relativeLoc() == 0 && item == views.count-3) {
            // Set offset -2
            return self.dragState.translation.width - (3*(300 + 20))
        } else {
            // This is the remainder
            return 10000
        }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
