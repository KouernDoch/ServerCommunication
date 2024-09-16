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
struct apiResponse : Decodable {
    var imageName : String
    var type : String
    var size : Int
    
}
struct ContentView: View {
    @State private var profileImage: Data?
    @State var aurthor : [MyResponseModel] = []
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            
            if let profileImage = profileImage, let uiImage = UIImage(data: profileImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } else {
                Text("Loading Image...")
                    .onAppear {
                        fetchImage()
                        let image = UIImage(named: "ecomerceLogo")
                        uploadfile(image:(image?.jpegData(compressionQuality: 1.0))!) // Call the uploadFile function when the view appears
                    }
            }
            
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
//                Task{
//                    await getdata()
//                }
                fetchImage()
                    let image = UIImage(named: "ecomerceLogo")
                    uploadfile(image:(image?.jpegData(compressionQuality: 1.0))!)
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
    
    
    func uploadfile(image : Data){
        let header:  HTTPHeaders = ["content-Type": "multipart/form-data"]
        
        AF.upload(multipartFormData: {
            multipartFormData in multipartFormData.append(image, withName: "file",fileName: ".png",mimeType: "image/*")
            
            
        }, to: "http://110.74.194.123:8080/api/v1/images/upload",method: .post,headers: header).responseJSON{response in
            switch response.result {
            case .success(_) :
                print("Data \(response.data!)")
                let res = try? JSONDecoder().decode(apiResponse.self, from: response.data!)
                print("This is imageName: \(res?.imageName ?? "")")
                print("This is Type: \(res?.type ?? "")")
                print("This is size: \(res?.size ?? 0)")
            case .failure(_):
                print("fail")
            }
        }
        
    }
    
    func fetchImage () {
        let url = URL(string: "http://110.74.194.123:8080/api/v1/images?fileName=b14b25fb-dc27-4eed-a60a-d9ed8471847b.png")!
        URLSession.shared.dataTask(with: url){
            data,_,error in
            print(data)
            DispatchQueue.main.async {
                self.profileImage =  data
            }
            
        }.resume()
    }
    
}


#Preview {
    ContentView()
}
