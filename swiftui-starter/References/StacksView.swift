//
//  StacksV iew.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/29/22.
//

import SwiftUI

struct StacksView: View {

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text("LBTA").background(.red)
                    Spacer().frame(height: 10.0).background(.orange).padding()
                }
                Spacer().frame(width: 10.0).background(.orange).padding()
                HStack {
                    Spacer().frame(height: 10.0).background(.orange).padding()
                    Text("LBTA").background(.red)
                }
            }.background(.blue)
        }
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                StacksView()
            }.preferredColorScheme($0)
        }
    }
}
