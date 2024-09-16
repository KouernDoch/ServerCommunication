//
//  PostView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 16/9/24.
//

import SwiftUI

struct PostView: View {
    @State var title = ""
    @State var description = ""
    var body: some View {
        NavigationView{
            VStack(){
                Rectangle()
                    .foregroundColor(Color(red: 0.914, green: 0.932, blue: 0.947))
                    .frame(height: 200)
                    .overlay{
                        Image(systemName: "photo")
                            .foregroundColor(Color(red: 0.73, green: 0.746, blue: 0.758))
                            .font(.custom("", size: 90))
                    }
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.title3)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    TextField("Enter Title",text: $title)
                        .textFieldStyle(.roundedBorder)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Description")
                        .font(.title3)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                    TextEditor(text: $description)
                        .background(RoundedRectangle(cornerRadius: 1).stroke(Color.gray, lineWidth: 1))
                        .padding(.bottom)
                    
                }
                Button(action:{}){
                    Text("Post")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(width: 300)
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(5)
                       
                }
                .padding(.bottom,40)
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Post Article")
        }
    }
}

#Preview {
    PostView()
}
