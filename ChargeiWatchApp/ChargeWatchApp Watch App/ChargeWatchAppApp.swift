//
//  ChargeWatchAppApp.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/13.
//

import SwiftUI

@main
struct ChargeWatchApp_Watch_AppApp: App {
    
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) private var extensionDelegate
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
        
//        WKNotificationScene(
//            controller: NotificationController.self,
//            category: "LandmarkNear"
//        )
        
        WKNotificationScene(
            controller: NotificationController.self,
            category: LocalNotifications.categoryIdentifier
        )
    }
    
}
