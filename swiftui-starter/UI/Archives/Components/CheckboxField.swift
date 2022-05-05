//
//  CheckboxField.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/29/22.
//

import SwiftUI

struct CheckboxField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int

    @Binding var isMarked: Bool

    init(
        id: String,
        label: String,
        size: CGFloat = 14,
        color: Color = Color.black.opacity(0.68),
        textSize: Int = 14,
        isMarked: Binding<Bool>
    ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        _isMarked = isMarked
    }

    // swiftlint:disable multiple_closures_with_trailing_closure
    var body: some View {
        Button(action: {
            self.isMarked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text(label)
                    .font(Font.system(size: size))
                    .foregroundColor(UIColor.label.toColor())
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}

struct CheckboxField_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                Text("Checkbox: ")
                CheckboxField(id: "Completed", label: "Completed", isMarked: .constant(true))
                Spacer()
            }.padding().preferredColorScheme($0)
        }
    }
}
