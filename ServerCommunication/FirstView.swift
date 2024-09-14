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
            Text("Hello")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Hello")
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Post")
                }
            Text("Hello")
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
