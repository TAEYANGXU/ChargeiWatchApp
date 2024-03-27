//
//  LandmarkListView.swift
//  ChargeWatchApp Watch App
//
//  Created by xuyanzhang on 2024/3/13.
//

import SwiftUI
import Alamofire
import ActivityIndicatorView

struct LandmarkListView: View {
    
    @State private var landmarks: [Landmark] = []
    @EnvironmentObject var modelData:ModelData;
    @State private var showFavoritesOnly = false
    @State private var showLoadingIndicator: Bool = true
    @State private var responseData: String = ""
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView(content: {
            List {
                ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .default())
                     .frame(width: 50.0, height: 50.0)
                     .foregroundColor(.red)
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkListRow(landmark: landmark)
                    }
                }
            }.animation(.default,value: filteredLandmarks).navigationTitle("Landmarks").onAppear(perform: {
                fetchData()
            })
        })
    }
    
    func fetchData()
    {
        AF.request("http://localhost:3000/json/landmarkData.json").responseString { response in
            switch response.result {
            case .success(let value):
                self.responseData = value
                self.showLoadingIndicator = false
                
                if let jsonData = value.data(using: .utf8) {
                let decoder = JSONDecoder()
                do {
                    let decodedLandmarks = try decoder.decode([Landmark].self, from: jsonData)
                    landmarks = decodedLandmarks
                    print(decodedLandmarks)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            case .failure(let error):
                print("error =\(error.localizedDescription)")
            }
        }
    }
}



//#Preview {
//    LandmarkListView().environmentObject(ModelData())
//}
