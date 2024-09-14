//
//  HomeView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 15/9/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            List{
                HStack{
                    Image("ecomerceLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("Post")
                            .font(.title)
                    }
                }
                HStack{
                    Image("ecomerceLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle("Article")
        }
    }
}

#Preview {
    HomeView()
}
