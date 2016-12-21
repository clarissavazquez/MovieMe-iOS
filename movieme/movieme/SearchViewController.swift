//
//  SearchViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/20/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func searchButton(sender: UIButton) {
        // TODO: Make API call to do search with searchBar.txt
        // Send to searchResultsViewController with list of movies returned from API call
        var movies = [Movie]()
        var movie = Movie(details: Dictionary<String, String>())
        movie.POSTER = "http://a.dilcdn.com/bl/wp-content/uploads/sites/6/2015/10/star-wars-force-awakens-official-poster.jpg"
        movies.append(movie)
        log(searchBar.text!)
        
        // Navigate to search results controller
        let searchResultsViewController: SearchResultsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SearchResultsViewController") as! SearchResultsViewController
        searchResultsViewController.movies = movies
        self.navigationController?.showViewController(searchResultsViewController, sender: sender)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
