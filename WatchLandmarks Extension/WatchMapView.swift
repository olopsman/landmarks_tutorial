//
//  WatchMapView.swift
//  WatchLandmarks Extension
//
//  Created by Paulo Orquillo on 10/04/20.
//  Copyright © 2020 Quonsepto Limited. All rights reserved.
//

import SwiftUI

struct WatchMapView: WKInterfaceObjectRepresentable {
    var landmark: Landmark
    
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) ->  WKInterfaceMap {
        return WKInterfaceMap()
    }
    
    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
        map.setRegion(region)
    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(landmark: UserData().landmarks[0])
    }
}
