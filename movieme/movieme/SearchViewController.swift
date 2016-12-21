/**
 *  SearchViewController.swift
 *
 *  This class implements the searching functionality of the app.
 */

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    let acd = APICallDelegator()
    
    // Summary: This method exercises doSearchForMovie.
    // Post-Condition: UI navigates to SearchResultsViewController
    //                 with list of movies generated in method.
    @IBAction func searchButton(sender: UIButton) {
        let title = searchBar.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        acd.doSearchForMovie(title) {(result: [Dictionary<String, String>]) -> Void in
            var movies = [Movie]()
            
            for movie in result {
                movies.append(Movie(details: movie))
            }
            
            // TODO: Handle empty movies
            
            // Handle empty list of movies
            if(!movies.isEmpty) {
                log("Movie Results: \(String(movies))")
                // 1. Declare a SearchResultsViewController called searchResultsViewController
                // 2. Set searchResultsViewController's movie list to the movie list generated in this method
                // 3. Navigate to searchResultsViewController
                let searchResultsViewController: SearchResultsViewController =
                    self.storyboard?.instantiateViewControllerWithIdentifier("SearchResultsViewController")
                    as! SearchResultsViewController
                searchResultsViewController.movies = movies
                self.navigationController?.showViewController(searchResultsViewController, sender: sender)
            } else {
                log("No results.")
                // 1. Declare a NoResultsViewController called noResultsViewController
                // 2. Set noResultsViewController's movie list to the movie list generated in this method
                // 3. Navigate to noResultsViewController
                let noResultsViewController: NoResultsViewController =
                    self.storyboard?.instantiateViewControllerWithIdentifier("NoResultsViewController")
                    as! NoResultsViewController
                self.navigationController?.showViewController(noResultsViewController, sender: sender)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
