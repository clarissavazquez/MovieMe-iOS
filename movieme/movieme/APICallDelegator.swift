//
//  APICallDelegator.swift
//  movieme
//
//  Created by psycho on 12/19/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import Foundation

class APICallDelegator {
    var product: [Serializable]?

    func doSearchForMovie(title: String?) {
        let searchdelegate = SearchDelegate()
        var movies = [Movie]()

        guard let title = title else {
            log("Title is nil")
            return
        }
        
        searchdelegate.setup(["property":"title", "value":title])
        searchdelegate.doInBackground() {(result: [Dictionary<String, String>]?) -> () in
            guard let result = result else {
                log("Result is nil")
                return
            }

            for movie in result {
                movies.append(Movie(details: movie))
            }

            self.product = movies
            NSNotificationCenter.defaultCenter().postNotificationName("com.movieme.rest.SearchDelegate", object: nil)
        }
    }
}