//
//  PostView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 16/9/24.
//

import SwiftUI
import PhotosUI

struct PostView: View {
    @State var title = ""
    @State var description = ""
    @State var imagedata : UIImage?
    @State var photoPickerItem : PhotosPickerItem?
    var body: some View {
        NavigationView{
            VStack(){
                PhotosPicker(selection: $photoPickerItem,matching: .images){
                    Rectangle()
                        .foregroundColor(Color(red: 0.914, green: 0.932, blue: 0.947))
                        .frame(height: 200)
                        .overlay{
                            if let dataImage = imagedata {
                                Image(uiImage: dataImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 200)
                                    .clipShape(Rectangle())
                            }else{
                                Image(systemName: "photo")
                                    .foregroundColor(Color(red: 0.73, green: 0.746, blue: 0.758))
                                    .font(.custom("", size: 90))
                            }
                        }
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
                Button(action:{
                    if let image = imagedata , let imageData = image.jpegData(compressionQuality: 0.8){
                        Postdata(image: imageData, title: title, contant: description) { success in
                            if success {
                                print("Article posted successfully.")
                            }else{
                                print("Failed to post article.")
                            }
                        }
                    }
                }){
                    
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
            .onChange(of: photoPickerItem){_,_ in
                Task{
                    if let photoPickerItem, let data = try? await photoPickerItem.loadTransferable(type: Data.self){
                        if let image = UIImage(data: data){
                            imagedata = image
                        }
                    }
                    photoPickerItem = nil
                }
                
            }
        }
    }
}

#Preview {
    PostView()
}
