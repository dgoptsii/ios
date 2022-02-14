//
//  UrlCreator.swift
//  Lab2
//
//  Created by Daria Goptsii on 15.02.2022.
//

import Foundation

class UrlCreator{
    let limit: Int
    let subreddit: String
    let initUrl = "https://www.reddit.com/r"
    var url:URL?{
        URL(string:"\(initUrl)/\(subreddit)/top.json?limit=\(limit)")
    }
    
    init (subreddit: String, limit:Int){
        self.limit=limit
        self.subreddit=subreddit
    }

}
