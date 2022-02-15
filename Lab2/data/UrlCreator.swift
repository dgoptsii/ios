//
//  UrlCreator.swift
//  Lab2
//
//  Created by Daria Goptsii on 15.02.2022.
//

import Foundation

class UrlCreator{
    var urlComponents = URLComponents()
    
    func createUrl(subreddit: String, params: [URLQueryItem] ) -> URL?{
        urlComponents.scheme = "https"
        urlComponents.host = "www.reddit.com"
        urlComponents.path = "/r/\(subreddit)/top.json"
        urlComponents.queryItems = params
        print(urlComponents.url?.absoluteString)
        return urlComponents.url
    }
    
    

}
