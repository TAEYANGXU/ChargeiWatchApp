//
//  NotificationController.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/13.
//

import Foundation
import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?

    let landmarkIndexKey = "landmarkIndex"

    override var body: NotificationView {
        NotificationView(title: title,
            message: message,
            landmark: landmark)
    }

    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()

        let notificationData =
            notification.request.content.userInfo as? [String: Any]

        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]

        title = alert?["title"] as? String
        message = alert?["body"] as? String

        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override class var sashColor: Color? { Color.green }
    override class var titleColor: Color? { Color.purple }
    override class var subtitleColor: Color? { Color.orange }
    override class var wantsSashBlur: Bool { true }
}
