//
//  UserData.swift
//  Landmarks
//
//  Created by Paulo Orquillo on 31/03/20.
//  Copyright © 2020 Quonsepto Limited. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
    
}

