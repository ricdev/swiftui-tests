//
//  AppDelegate.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import UIKit
import Combine
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let networkManager = NetworkManager()
        networkManager.getBoutiques() { boutiques, error in
            guard let boutiques = boutiques else { return }
            for boutique in boutiques {
                print(" data: \(boutique)")
            }
            print("  error: \(String(describing: error))")
        }
        
        let splashViewModel: SplashViewModel = SplashViewModel(title: "Sample")
        let contentView = SplashView(viewModel: splashViewModel)
        let rootViewController = UIHostingController(rootView: contentView)

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()
        
        window!.backgroundColor = UIColor.white
        
        return true
    }
}

//final class AppConfiguration {
//
//    static let shared = AppConfiguration()
//
//    lazy var apiKey: String = {
////        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
////            fatalError("ApiKey must not be empty in plist")
////        }
////        return apiKey
//        return "123"
//    }()
//    lazy var apiBaseURL: String = {
////        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
////            fatalError("ApiBaseURL must not be empty in plist")
////        }
////        return apiBaseURL
//        return "https://raw.githubusercontent.com/ricdev/swiftui-tests/"
//    }()
//    lazy var imagesBaseURL: String = {
////        guard let imageBaseURL = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String else {
////            fatalError("ApiBaseURL must not be empty in plist")
////        }
////        return imageBaseURL
//        return "https://raw.githubusercontent.com/ricdev/swiftui-tests/"
//    }()
//
//    // MARK: - Network
//    lazy var apiDataTransferService: DataTransferService = {
//        let config = ApiDataNetworkConfig(baseURL: URL(string: apiBaseURL)!,
//                                          queryParameters: ["api_key": apiKey,
//                                                            "language": NSLocale.preferredLanguages.first ?? "en"])
//
//        let apiDataNetwork = DefaultNetworkService(config: config)
//        return DefaultDataTransferService(with: apiDataNetwork)
//    }()
//}
