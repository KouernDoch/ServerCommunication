//
//  HomeView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 15/9/24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @State var apiresponse : Article?
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

                ForEach(apiresponse?.payload ?? []){ res in
                    Button(action:{
                        isNavigationDetail = true
                    }){
                        HStack{
                            KFImage(URL(string: res.imageURL ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            VStack(alignment: .leading){
                                Text("\(res.title ?? "")")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                Text("\(res.content ?? "")")
                                    .foregroundColor(Color.gray)
                                    .lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                HStack{
                                    Group{
                                        Text("\(res.author ?? "")")
                                        Spacer()
                                        Text("\(res.publishedDate ?? "")")
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
        .onAppear{
            GetAllPost { article in
                if let article = article {
                    apiresponse.self = article
                }else{
                    print("Failed to fetch data")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
