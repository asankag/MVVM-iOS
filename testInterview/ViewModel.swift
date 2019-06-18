//
//  ViewModel.swift
//  testInterview
//
//  Created by Asanka on 6/18/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    @IBOutlet var moviesClient: MoviewClient!
    var movies: [NSDictionary] = []
    
    func fetchMovies(completion:@escaping () -> ()) {
        moviesClient.fatchMovies { movies in
            self.movies = movies!
            completion()
        }
    }
    
    func numberofItemsInSection(section: Int) -> Int {
        return movies.count 
    }
    
    func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
        return movies[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
}
