//
//  ProfileView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 16/9/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var isOn: Bool = true
    @State var test = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.a book or other written or printed work."
    var body: some View {
        VStack(){
            ZStack{
                Image("imagewellpaper")
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 200)
                Circle()
                    .frame(width: 80)
                    .overlay(
                        Image("ecomerceLogo")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle()) // Clips the image to match the circle shape
                    )
                    .overlay(
                        Circle()
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.blue, .purple,.yellow,.red,.purple,.primary]), // Gradient colors
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 3 // Border width
                            )
                    )
                    .offset(y:100)
            }
            Text("KOUERN DOCH")
                .bold()
                .padding(.top,40)
            VStack(alignment: .leading){
                Text("Little About me")
                    .font(.title3)
                    .bold()
                TextEditor(text: $test)
                    .disabled(true)
                Text("Language Setting")
                    .font(.title3)
                    .bold()
                HStack {
                    Text("KH")
                        .font(.headline)
                    Toggle(isOn: $isOn) {
                        
                    }
                    .labelsHidden()
                    
                    Text("EN")
                        .font(.headline)
                }
                .padding()
            }
            .padding()
            Button(action:{}){
                Text("Log Out")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(width: 300)
                    .padding(10)
                    .background(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0))
                    .cornerRadius(5)
                   
            }
            .padding(.bottom)
            Spacer()
        }
        
    }
}

#Preview {
    ProfileView()
}
