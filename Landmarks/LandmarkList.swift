//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Paulo Orquillo on 5/12/19.
//  Copyright © 2019 Quonsepto Limited. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
            ForEach(landmarkData) { landmark in
                if !self.showFavoritesOnly || landmark.isFavorite {
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone Xs Max","iPhone SE", ], id: \.self) { deviceName in LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}