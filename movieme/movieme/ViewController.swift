//
//  ViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let log = "ViewController"
    let acd = APICallDelegator()
    @IBOutlet weak var searchResults: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.didReceiveSearchResults), name: "com.movieme.rest.SearchDelegate", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClickSearch(sender: UIButton) {
        acd.doSearchForMovie("star wars")
    }

    func didReceiveSearchResults() {
        if let movies = acd.product as? [Movie] {
            searchResults.text = movies[0].TITLE
        }
    }
}

