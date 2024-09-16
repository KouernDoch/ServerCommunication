//
//  Article.swift
//  ServerCommunication
//
//  Created by Doch on 16/09/2024.
//

import Foundation
import Alamofire

func GetAllPost(completion : @escaping(Article?)->Void){
    var res : Article?
    let baseUrl = "http://110.74.194.125:8080/api/v1/articles"
    AF.request(baseUrl).validate().responseData{response in
        switch response.result{
        case .success(_) :
            do{
                res = try JSONDecoder().decode(Article.self, from: response.data!)
                completion(res)
            }catch{
                print(error)
            }
        case .failure(let error):
            print("Error fetchData \(error.asAFError)")
        }
    }
}

func Postdata(image: Data,title: String,contant: String,completion: @escaping (Bool) -> Void){
    uploadImage(image: image) { imageName in
        if let imageName = imageName {
            let baseUrl = "http://110.74.194.125:8080/api/v1/articles"
            let headers: HTTPHeaders = ["Content-Type": "application/json"]
          
                let article = ArticleRequest(
                    title: title,
                    content: contant,
                    imageUrl: "http://110.74.194.125:8080/api/v1/images?fileName=\(imageName)",
                    author: "John Doe",
                    publishedDate: "2024-09-16",
                    views: 0,
                    isPublished: true
                )
            do{
                let parameters: [String: Any] = [
                       "title": article.title,
                       "content": article.content,
                       "imageUrl": article.imageUrl,
                       "author": article.author,
                       "publishedDate": article.publishedDate,
                       "views": article.views,
                       "isPublished": article.isPublished
                   ]
                
                AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                    .validate()
                    .responseData{
                        response in
                        switch response.result {
                        case .success:
                            print("Article successfully posted")
                            completion(true)
                        case .failure(let error):
                            print("Failed to post article: \(error)")
                            completion(false)
                        }
                    }
                
            }catch{
                print("Failed to encode article: \(error)")
                completion(false)
            }
            
        }else{
            print("Fial fetch image")
        }
    }
}

func uploadImage(image : Data,completion: @escaping (String?) -> Void){
    
    let baseUrl = "http://110.74.194.125:8080/api/v1/images/upload"
    let headers: HTTPHeaders = ["Content-Type":"multipart/form-data"]
    
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(image, withName: "file",fileName: ".png",mimeType: "Image/*")
    }, to: baseUrl,headers: headers).validate().responseData { response in
        switch response.result {
        case .success(_):
            let res = try? JSONDecoder().decode(FileInfor.self, from: response.data!)
            completion(res?.imageName)
        case .failure(let error):
            print(error.asAFError)
            completion(nil)
        }
    }
    
}
