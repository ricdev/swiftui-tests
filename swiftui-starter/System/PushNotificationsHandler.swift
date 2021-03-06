//
//  PushNotificationsHandler.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/18/22.
//

import UserNotifications

protocol PushNotificationsHandler {}

class RealPushNotificationsHandler: NSObject, PushNotificationsHandler {
    private let deepLinksHandler: DeepLinksHandler

    init(deepLinksHandler: DeepLinksHandler) {
        self.deepLinksHandler = deepLinksHandler
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension RealPushNotificationsHandler: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_: UNUserNotificationCenter,
                                willPresent _: UNNotification,
                                withCompletionHandler completionHandler:
                                @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .sound])
    }

    func userNotificationCenter(_: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void)
    {
        let userInfo = response.notification.request.content.userInfo
        handleNotification(userInfo: userInfo, completionHandler: completionHandler)
    }

    func handleNotification(userInfo: [AnyHashable: Any], completionHandler: @escaping () -> Void) {
        guard let payload = userInfo["aps"] as? NotificationPayload,
              let countryCode = payload["country"] as? Country.Code
        else {
            completionHandler()
            return
        }
        deepLinksHandler.open(deepLink: .showCountryFlag(alpha3Code: countryCode))
        completionHandler()
    }
}
