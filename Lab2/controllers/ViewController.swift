//
//  ViewController.swift
//  Lab2
//
//  Created by Daria Goptsii on 12.02.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
 
    @IBOutlet weak var userName: UILabel!

    @IBOutlet weak var hours: UILabel!
    
    @IBOutlet weak var comments: UIButton!
    
    @IBOutlet weak var domain: UILabel!
    
    @IBOutlet weak var rating: UIButton!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var favorite: UIButton!
    
    
//    
//    func createUrl(subreddit: String, limit:Int)->URL?{
//        return URL(string:"https://www.reddit.com/r/\(subreddit)/top.json?limit=\(limit)")
//    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Obtain Reference to Shared Session
        let sharedSession = URLSession.shared
        if let url = UrlCreator(subreddit: "ios", limit:1).url{
            // Create Request
            let request = URLRequest(url: url)
            // Create Data Task
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
               if let data = data{
                    DispatchQueue.global().async {
                        guard let post = try? Post(data: JSONDecoder().decode(PostJson.self, from: data))
                        else{
                          return
                        }

                        DispatchQueue.main.async {
                            self.userName.text = post.author
                            self.userName.text = post.author
                            self.domain.text = post.domain
                            self.text.text = post.title
                            self.hours.text = Date.init(timeIntervalSince1970: post.created).timeAgoDisplay()
                            if post.favorite {
                            let imageFav = UIImage(systemName: "bookmark.fill")
                            self.favorite.setImage(imageFav, for: .normal)
                            } else {
                            let imageFav = UIImage(systemName: "bookmark")
                            self.favorite.setImage(imageFav, for: .normal)
                                self.comments.setTitle("\(post.numComments)", for: .normal)
                            }
                            self.rating.setTitle("\(post.score)", for: .normal)
                            self.comments.setTitle("\(post.numComments)", for: .normal)
                            if let img = URL(string:post.url){
                                if let data = try? Data(contentsOf: img) {
                                    self.image.image  = UIImage(data: data)
                                }
                            }
                        }
                    }
                }
            })

            dataTask.resume()
        }

    }


    
}


