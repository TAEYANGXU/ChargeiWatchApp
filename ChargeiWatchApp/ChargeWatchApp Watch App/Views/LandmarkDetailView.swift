//
//  LandmarkDetailView.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/14.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    var landmark:Landmark
    var body: some View {
        Text(landmark.name)
    }
}

//#Preview {
//    LandmarkDetailView()
//}
