//
//  LocalNotifications.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/13.
//

import Foundation
import UserNotifications

final class LocalNotifications: NSObject {
    
    static let categoryIdentifier = "LandmarkNear"
    
    private let actionIdentifier = "viewCatsAction"
    
    override init() {
        super.init()
        
        Task {
            do {
                try await self.register()
                try await self.schedule()
            } catch {
                print("⌚️ local notification: \(error.localizedDescription)")
            }
        }
    }
    
    func register() async throws {
        let current = UNUserNotificationCenter.current()
        try await current.requestAuthorization(options: [.alert, .sound])

        current.removeAllPendingNotificationRequests()

        let action = UNNotificationAction(
            identifier: self.actionIdentifier,
            title: "More Cats!",
            options: .foreground)

        let category = UNNotificationCategory(
            identifier: Self.categoryIdentifier,
            actions: [action],
            intentIdentifiers: [])

        current.setNotificationCategories([category])
        current.delegate = self
    }

    func schedule() async throws {
        let current = UNUserNotificationCenter.current()
        let settings = await current.notificationSettings()
        guard settings.alertSetting == .enabled else { return }

        let content = UNMutableNotificationContent()
        content.title = "LandmarkNear"
        content.subtitle = "Guess what time it is"
        content.body = "LandmarkNear time!"
        content.categoryIdentifier = Self.categoryIdentifier

        let components = DateComponents(hour: 1, minute: 50)
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: components,
            repeats: true)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)

        try await current.add(request)
    }
}

extension LocalNotifications: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.list, .sound]
    }
}
