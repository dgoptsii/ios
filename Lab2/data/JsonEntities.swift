//
//  JsonEntities.swift
//  Lab2
//
//  Created by Daria Goptsii on 13.02.2022.
//

import Foundation

struct Post{
    let domain: String
    let title: String
    let score: Int
    let created: Double
    let author: String
    let numComments: Int
    let url: String
    var favorite: Bool{
        Bool.random()
    }
    
    init (data: PostJson){
        domain = data.data.children[0].data.domain
        title = data.data.children[0].data.title
        score = data.data.children[0].data.score
        created = data.data.children[0].data.created
        author = data.data.children[0].data.author
        numComments = data.data.children[0].data.numComments
        url = data.data.children[0].data.url
    }
}

struct PostJson: Decodable {
    let data: PostData
}
struct PostData: Decodable {
    let children: [Child]
}

struct Child: Decodable {
    let data: ChildData
}
struct ChildData: Decodable {
    let domain: String
    let title: String
    let score: Int
    let created: Double
    let author: String
    let numComments: Int
    let url: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.numComments = try values.decode(Int.self, forKey: .numComments)
        self.domain = try values.decode(String.self, forKey: .domain)
        self.title = try values.decode(String.self, forKey: .title)
        self.score = try values.decode(Int.self, forKey: .score)
        self.created = try values.decode(Double.self, forKey: .created)
        self.author = try values.decode(String.self, forKey: .author)
        self.url = try values.decode(String.self, forKey: .url)
      }
    
    enum CodingKeys: String, CodingKey {
        case numComments = "num_comments"
        case domain
        case title
        case score
        case created
        case author
        case url
    }
}
