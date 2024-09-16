//
//  HomeView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 15/9/24.
//

import SwiftUI

struct HomeView: View {
    var data : [PostInfor] = [
    PostInfor(title: "Post", description: "Product testing", authorName: "Doch", date: "Thur 7:00 AM",Image: "ecomerceLogo"),
    PostInfor(title: "Post", description: "Product testing", authorName: "Doch", date: "Thur 7:00 AM",Image: "ecomerceLogo"),
    PostInfor(title: "Post", description: "Product testing", authorName: "Doch", date: "Thur 7:00 AM",Image: "ecomerceLogo"),
    PostInfor(title: "Post", description: "Product testing", authorName: "Doch", date: "Thur 7:00 AM",Image: "ecomerceLogo"),
    PostInfor(title: "Post", description: "Product testing", authorName: "Doch", date: "Thur 7:00 AM",Image: "ecomerceLogo"),
    PostInfor(title: "Post", description: "Product testing", authorName: "Doch", date: "Thur 7:00 AM",Image: "ecomerceLogo")
    ]
    
    @State var title = ""
    @State var isNavigationDetail = false
    var body: some View {
        NavigationView{
            List{
                Section {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search",text: $title)
                    }
                }.listRowBackground(Color(hue: 1.0, saturation: 0.0, brightness: 0.899))

                ForEach(data){ res in
                    Button(action:{
                        isNavigationDetail = true
                    }){
                        HStack{
                            Image(res.Image ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            VStack(alignment: .leading){
                                Text(res.title ?? "")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                Text(res.description ?? "")
                                    .foregroundColor(Color.gray)
                                HStack{
                                    Group{
                                        Text(res.authorName ?? "")
                                        Spacer()
                                        Text(res.date ?? "")
                                    }
                                    .foregroundColor(Color.gray)
                                }
                                
                            }.padding(.horizontal)
                        }
                    }
                }
                    
                }
            .background{
                NavigationLink(destination: FirstView(), isActive: $isNavigationDetail){
                    EmptyView()
                }
            }
            .navigationTitle("Article")
        }
    }
}

#Preview {
    HomeView()
}
