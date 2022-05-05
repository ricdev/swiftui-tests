//
//  SceneDelegate.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/18/22.
//

import Combine
import Foundation
import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var systemEventsHandler: SystemEventsHandler?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let environment = AppEnvironment.bootstrap()
//        let contentView = KeyTakeawaysView(currentTheme: themes[0], data: .constant(KeyTakeaways.sampleData))
//        let contentView =  KeyTakeawayView(currentTheme: themes[0], data: .constant(KeyTakeaway.sampleData))
//        let contentView = SplashView(viewModel: SplashViewModel(title: "Demo"))
//        let contentView = SplashView(viewModel: SplashViewModel(title: "Demo"))

//        var UIState: UIStateModel = UIStateModel()
//        let contentView = InlineCarouselView( UIState: UIState )
//        let contentView = InlineCarouselView()

        let contentView = QuoteView(currentTheme: themes[0], data: .constant(Quotes.sampleData))

//        let contentView = SplashView(viewModel: SplashViewModel(title: "Demo"))
//        let contentView = ContentView(viewModel:
//            ContentView.ViewModel(container: environment.container))
//        let contentView = ContentView()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
        }
        systemEventsHandler = environment.systemEventsHandler
        if !connectionOptions.urlContexts.isEmpty {
            systemEventsHandler?.sceneOpenURLContexts(connectionOptions.urlContexts)
        }
    }

    func scene(_: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        systemEventsHandler?.sceneOpenURLContexts(URLContexts)
    }

    func sceneDidBecomeActive(_: UIScene) {
        systemEventsHandler?.sceneDidBecomeActive()
    }

    func sceneWillResignActive(_: UIScene) {
        systemEventsHandler?.sceneWillResignActive()
    }
}
