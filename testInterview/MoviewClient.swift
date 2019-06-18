//
//  MoviewClient.swift
//  testInterview
//
//  Created by Asanka on 6/18/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class MoviewClient: NSObject {
    
    func fatchMovies(completion: @escaping ([NSDictionary]?)-> ()){
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: urlString)!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            do {
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                if let movies = parsedData.value(forKeyPath: "feed.entry") as? [NSDictionary]{
                    completion(movies)
                    return
                }
                
            } catch let error as NSError {
                print(error)
            }
        })
        task.resume()
    }
}
