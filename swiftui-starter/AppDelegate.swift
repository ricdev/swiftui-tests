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

