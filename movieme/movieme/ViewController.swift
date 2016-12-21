//
//  ViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//

//  DEMONSTRATION ONLY
import UIKit

class ViewController: UIViewController {
    let acd = APICallDelegator()
    var movies = [Movie]()
    @IBOutlet weak var searchResults: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //  summary: this method exercises doSearchForMovie.
    //           any updates to the UI or state of the View
    //           should be a part of the trailing closure.
    @IBAction func didClickSearch(sender: UIButton) {
        acd.doSearchForMovie("star wars") {(result: [Dictionary<String, String>]) -> Void in
            var movies = [Movie]()

            for movie in result {
                movies.append(Movie(details: movie))
            }

            self.movies = movies
            self.searchResults.text = self.movies[0].TITLE
            log("complete: \(String(self.movies))")
        }
    }
}

