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
