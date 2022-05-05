//
//  AppDelegate.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import Combine
import Firebase
import FirebaseMessaging
import SwiftUI
import UIKit
import UserNotifications

typealias NotificationPayload = [AnyHashable: Any]
typealias FetchCompletion = (UIBackgroundFetchResult) -> Void

// swiftlint:disable line_length
@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"

    lazy var systemEventsHandler: SystemEventsHandler? = self.systemEventsHandler(UIApplication.shared)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configure(application)
        return true
    }

    private func systemEventsHandler(_ application: UIApplication) -> SystemEventsHandler? {
        return sceneDelegate(application)?.systemEventsHandler
    }

    private func sceneDelegate(_ application: UIApplication) -> SceneDelegate? {
        return application.windows
            .compactMap { $0.windowScene?.delegate as? SceneDelegate }
            .first
    }
}

extension AppDelegate {
    func configure(_ application: UIApplication) {
        registerForPushNotifications()
        initializeFirebaseNotification(application)
        initializeFonts()
    }

    func initializeFonts() {
        _ = FontFamily.BrilliantCutProB7.medium.font(size: 16)
        _ = FontFamily.BrilliantCutProB7.bold.font(size: 16)
        _ = FontFamily.BrilliantCutProB7.regular.font(size: 16)
        _ = FontFamily.BrilliantCutProB7.black.font(size: 16)
        _ = FontFamily.BrilliantCutProB7.light.font(size: 16)
        _ = FontFamily.BrilliantCutProB7.thin.font(size: 16)

        _ = FontFamily.FancyCutProB7.light.font(size: 16)
        _ = FontFamily.FancyCutProB7.lightItalic.font(size: 16)
        _ = FontFamily.FancyCutProB7.medium.font(size: 16)
        _ = FontFamily.FancyCutProB7.mediumItalic.font(size: 16)
        _ = FontFamily.FancyCutProB7.regular.font(size: 16)
        _ = FontFamily.FancyCutProB7.regularItalic.font(size: 16)
        _ = FontFamily.FancyCutProB7.bold.font(size: 16)
        _ = FontFamily.FancyCutProB7.boldItalic.font(size: 16)
        _ = FontFamily.FancyCutProB7.thin.font(size: 16)
        _ = FontFamily.FancyCutProB7.thinItalic.font(size: 16)

        _ = FontFamily.FancyCutExtProB7.light.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.lightItalic.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.medium.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.mediumItalic.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.regular.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.regularItalic.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.bold.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.boldItalic.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.thin.font(size: 16)
        _ = FontFamily.FancyCutExtProB7.thinItalic.font(size: 16)

        _ = FontFamily.FancyCutCondProB7.light.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.lightItalic.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.medium.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.mediumItalic.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.regular.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.regularItalic.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.bold.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.boldItalic.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.thin.font(size: 16)
        _ = FontFamily.FancyCutCondProB7.thinItalic.font(size: 16)
    }
}

// Cloud Messaging
extension AppDelegate: MessagingDelegate {
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                print("Permission granted: \(granted)")
            }
    }

    func application(_: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)
                         -> Void) {
        systemEventsHandler?
            .appDidReceiveRemoteNotification(payload: userInfo, fetchCompletion: completionHandler)

        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }

        // Print full message.
        print(userInfo)

        completionHandler(UIBackgroundFetchResult.newData)
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        systemEventsHandler?.handlePushRegistration(result: .failure(error))

        print(error)
    }

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        systemEventsHandler?.handlePushRegistration(result: .success(deviceToken))

        print(deviceToken)
        Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
    }

    func initializeFirebaseNotification(_ application: UIApplication) {
        FirebaseManager.shared.fakeInit() // FirebaseApp.configure()

        // Setup Cloud Messaging
        Messaging.messaging().delegate = self

        // Setup Notification
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =
                .init(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
    }

    func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        print("token: \(dataDict)")
    }
}

// User Notification (In-app notification)
@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler:
                                @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo

        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }

        print("userInfo: \(userInfo)")
        completionHandler([[.banner, .badge, .sound]])
    }

    func userNotificationCenter(_: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo

        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }

        // Print full message.
        print(userInfo)

        completionHandler()
    }
}
