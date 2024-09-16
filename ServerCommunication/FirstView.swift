//
//  FirstView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 15/9/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            PostView()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Post")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    FirstView()
}
