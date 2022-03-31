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

    // swiftlint:disable line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.configure()

//        let contentView = SplashView(viewModel: SplashViewModel(title: "Demo"))
        let contentView = IntroView(viewModel: IntroViewModel())
//        let contentView = LoginOptionsView()
//        let contentView = FontTypesView()
//        let contentView = IntroView(viewModel: IntroViewModel())
        let rootViewController = UIHostingController(rootView: contentView)

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()

        window!.backgroundColor = UIColor.white

        return true
    }

    func configure() {
        self.initializeFonts()
    }

    // swiftlint:disable redundant_discardable_let
    func initializeFonts() {
        let _ = FontFamily.BrilliantCutProB7.medium.font(size: 16)
        let _ = FontFamily.BrilliantCutProB7.bold.font(size: 16)
        let _ = FontFamily.BrilliantCutProB7.regular.font(size: 16)
        let _ = FontFamily.BrilliantCutProB7.black.font(size: 16)
        let _ = FontFamily.BrilliantCutProB7.light.font(size: 16)
        let _ = FontFamily.BrilliantCutProB7.thin.font(size: 16)

        let _ = FontFamily.FancyCutProB7.light.font(size: 16)
        let _ = FontFamily.FancyCutProB7.lightItalic.font(size: 16)
        let _ = FontFamily.FancyCutProB7.medium.font(size: 16)
        let _ = FontFamily.FancyCutProB7.mediumItalic.font(size: 16)
        let _ = FontFamily.FancyCutProB7.regular.font(size: 16)
        let _ = FontFamily.FancyCutProB7.regularItalic.font(size: 16)
        let _ = FontFamily.FancyCutProB7.bold.font(size: 16)
        let _ = FontFamily.FancyCutProB7.boldItalic.font(size: 16)
        let _ = FontFamily.FancyCutProB7.thin.font(size: 16)
        let _ = FontFamily.FancyCutProB7.thinItalic.font(size: 16)

        let _ = FontFamily.FancyCutExtProB7.light.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.lightItalic.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.medium.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.mediumItalic.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.regular.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.regularItalic.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.bold.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.boldItalic.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.thin.font(size: 16)
        let _ = FontFamily.FancyCutExtProB7.thinItalic.font(size: 16)

        let _ = FontFamily.FancyCutCondProB7.light.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.lightItalic.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.medium.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.mediumItalic.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.regular.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.regularItalic.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.bold.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.boldItalic.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.thin.font(size: 16)
        let _ = FontFamily.FancyCutCondProB7.thinItalic.font(size: 16)
    }
}
