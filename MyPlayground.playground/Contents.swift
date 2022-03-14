import UIKit

var greeting = "Hello, playground"




//import Combine
//import SwiftUI
//
//class GameSettings: ObservableObject {
//    @Published var score = 0
//}
//
//class ScoreInputViewModel: ObservableObject {
//
//    @Published var timerText: String = ""
//    @State private var counter = 0
//
//    init() {
//    }
//}
//
//struct ScoreInputView: View {
//
//    @StateObject var settings = GameSettings()
//    @ObservedObject var viewModel = ScoreInputViewModel()
//
//    struct TimerView: View {
//        @Binding var uuid: String
//        var body: some View {
//            return VStack {
//                TextField("UUID", text: $uuid)
//                    .padding()
//                    .cornerRadius(5.0)
//                    .padding(.bottom, 20)
//                Text("LOGIN")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 220, height: 60)
//                    .background(Color.green)
//                    .cornerRadius(15.0)
//            }
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//
//                Button("Increase Score") {
//                    settings.score += 1
//                }
//
//                NavigationLink(destination: ScoreView()) {
//                    Text("Show Detail View")
//                }
//            }
//            .frame(height: 200)
//        }
//        .environmentObject(settings)
//    }
//}
//
//struct ScoreView: View {
//    @EnvironmentObject var settings: GameSettings
//
//    var body: some View {
//        Text("Score: \(settings.score)")
//    }
//}
//
//struct ScoreInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreInputView()
//    }
//}
//
//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
