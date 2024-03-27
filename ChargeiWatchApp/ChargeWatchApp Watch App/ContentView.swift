//
//  ContentView.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/13.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @EnvironmentObject var modelData:ModelData;
    
    var body: some View {
        VStack {
            LandmarkListView()
        }
    }
    
    
    
//    func registerForPushNotifications()
//    {
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(
//            options: [.alert, .sound, .badge]
//        ){ (granted,error) in
//            print("granted =\(granted)")
//            if !granted {
//                print("用户不同意授权通知权限")
//                return
//            }
//            
//        }
//    }
}


//#Preview {
//    ContentView()
//}
