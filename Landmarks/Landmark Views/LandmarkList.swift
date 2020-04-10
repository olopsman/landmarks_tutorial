//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Paulo Orquillo on 5/12/19.
//  Copyright © 2019 Quonsepto Limited. All rights reserved.
//

import SwiftUI

struct LandmarkList<DetailView: View>: View {
    @EnvironmentObject var userData: UserData
    
    let detailViewProducer: (Landmark) -> DetailView
    
    var body: some View {
        
            List{
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: self.detailViewProducer(landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
        
    }
}
#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
// NavigationView is unavailable on watchOS
//        NavigationView {
//            ForEach(["iPhone Xs Max","iPhone SE", ], id: \.self) { deviceName in LandmarkList{PreviewDetailView(landmark: $0)}
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//            }
//           .environmentObject(UserData())
//        }
        LandmarkList { PreviewDetailView(landmark: $0) }
                   .environmentObject(UserData())

    }
}
