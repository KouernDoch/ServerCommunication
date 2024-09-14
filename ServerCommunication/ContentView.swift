//
//  ContentView.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 14/9/24.
//

import SwiftUI
import Alamofire


class MyResponseModel: Decodable,ObservableObject {
    let id: Int?
    let idBook: Int?
    let firstName: String?
    let lastName: String?
}

struct ContentView: View {
    
    @State var aurthor : [MyResponseModel] = []
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if isLoading {
                ProgressView("Loading...")
            } else if let firstAuthor = aurthor.first {
                Text("First Author: \(firstAuthor.firstName ?? "Unknown")")
            } else {
                Text("No data yet.")
            }
            Button("Getdata"){
                Task{
                    await getdata()
                }
//                print("data")
//                getdata1()

                
            }
        }
        .padding()
    }
    
    
    func getdata() async {
        print("Test")
        let url = "https://fakerestapi.azurewebsites.net/api/v1/Authors"
        isLoading = true
        //        AF.request(url,method: .get).validate().responseData{
        //            response in
        //            switch response.result {
        //            case .success(let data):
        //                do{
        //                    let decodeData = try JSONDecoder().decode([MyResponseModel].self,from: data )
        //                    aurthor = decodeData
        //                }catch {
        //                    print("Failed to decode: \(error)")
        //                }
        //
        //            case .failure(let error):
        //                print("Error:", error)
        //            }
        //        }
        do{
            let data = try await AF.request(url).serializingData().value
            let decodeData = try JSONDecoder().decode([MyResponseModel].self,from: data )
            aurthor = decodeData
        }catch{
            print("Failded to fetch or decode data\(error)")
        }
        
        isLoading = false
        
    }
    
    func getdata1()  {
        print("Test1 ")
        let url = "https://fakerestapi.azurewebsites.net/api/v1/Authors"
        isLoading = true
                AF.request(url,method: .get).validate().responseData{
                    response in
                    switch response.result {
                    case .success(let data):
                        do{
                            let decodeData = try JSONDecoder().decode([MyResponseModel].self,from: data )
                            aurthor = decodeData
                        }catch {
                            print("Failed to decode: \(error)")
                        }
        
                    case .failure(let error):
                        print("Error:", error)
                    }
                }
//        do{
//            let data = try  AF.request(url).serializingData().value
//            let decodeData = try JSONDecoder().decode([MyResponseModel].self,from: data )
//            aurthor = decodeData
//        }catch{
//            print("Failded to fetch or decode data\(error)")
//        }
//        
        isLoading = false
        
    }
    
    func getdata2()  {
        print("Test2 ")
        let url = "https://fakerestapi.azurewebsites.net/api/v1/Authors"
        isLoading = true
                AF.request(url,method: .get).validate().responseData{
                    response in
                    switch response.result {
                    case .success(let data):
                        do{
                            let decodeData = try JSONDecoder().decode([MyResponseModel].self,from: data )
                            aurthor = decodeData
                        }catch {
                            print("Failed to decode: \(error)")
                        }
        
                    case .failure(let error):
                        print("Error:", error)
                    }
                }
//        do{
//            let data = try  AF.request(url).serializingData().value
//            let decodeData = try JSONDecoder().decode([MyResponseModel].self,from: data )
//            aurthor = decodeData
//        }catch{
//            print("Failded to fetch or decode data\(error)")
//        }
//
        isLoading = false
        
    }
}

#Preview {
    ContentView()
}
