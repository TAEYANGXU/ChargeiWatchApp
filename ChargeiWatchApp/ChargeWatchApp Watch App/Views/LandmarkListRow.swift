//
//  LandmarkListRow.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/14.
//

import SwiftUI
import SDWebImageSwiftUI

struct LandmarkListRow: View {
    var landmark:Landmark
    var body: some View {
        HStack {
            WebImage(url: URL(string: landmark.imageUrl)).resizable().aspectRatio(contentMode: .fit).frame(width: 40,height:40).cornerRadius(6).padding(EdgeInsets(top: 10, leading: 10, bottom: 10,trailing: 5))
                                                                                                                                                      
//            landmark.image.resizable().frame(width: 40,height:40).cornerRadius(6).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 5))
            Text(landmark.name).foregroundColor(.blue)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
                Spacer(minLength: 0)
            }
        }.background(Color.white).cornerRadius(10)
    }
}
#Preview {
    let landmarks = ModelData().landmarks
    return LandmarkListRow(landmark: landmarks[0])
}
