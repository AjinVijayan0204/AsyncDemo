//
//  Model.swift
//  ASyncTestCheck
//
//  Created by Ajin on 05/07/22.
//

import Foundation

struct PostModel:Codable{
    var postId : Int
    var id :Int
    var name : String
    var email: String
    var body: String
}

struct sampleRecord: Codable {
    let posts: [PostModel]
}
