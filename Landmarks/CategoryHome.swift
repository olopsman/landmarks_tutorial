//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Paulo Orquillo on 6/04/20.
//  Copyright © 2020 Quonsepto Limited. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories:[String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: {$0.category.rawValue}
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter {$0.isFeatured}
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: {self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmark: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self) {key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                    
                    
                }.listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()){
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile){
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmark: [Landmark]
    var body: some View {
        landmark[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
