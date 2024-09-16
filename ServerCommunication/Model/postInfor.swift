//
//  postInfor.swift
//  ServerCommunication
//
//  Created by Kourn Doch on 16/9/24.
//

import Foundation

struct PostInfor : Identifiable{
    var id = UUID()
    var title : String?
    var description : String?
    var authorName : String?
    var date : String?
    var Image : String?
}

struct Article: Codable {
    let message: String?
    let payload: [Payload]?
    let status, timestamp: String?
}
struct Payload: Codable,Identifiable {
    let id: Int?
    let title, content: String?
    let imageURL: String?
    let author, publishedDate: String?
    let views: Int?
    let isPublished: Bool?
    enum CodingKeys: String, CodingKey {
        case id, title, content
        case imageURL = "imageUrl"
        case author, publishedDate, views, isPublished
    }
}

struct FileInfor : Codable{
    let imageName, type: String?
    let size: Int?
}

struct ArticleRequest: Codable {
    let title: String
    let content: String
    let imageUrl: String
    let author: String
    let publishedDate: String
    let views: Int
    let isPublished: Bool
}
