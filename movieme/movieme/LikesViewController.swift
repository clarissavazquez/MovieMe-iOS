//
//  LikesViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/27/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    let acd = APICallDelegator()
    var movies = [Movie]()
    
    
    // Implement methods for UICollectionViewDataSource protocol
    
    // Tell collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    // Make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UIButton in the cell
        // and set its background image to the current movie's poster
        if let url = NSURL(string: self.movies[indexPath.item].POSTER) {
            if let data = NSData(contentsOfURL: url) {
                cell.posterImageButton.setBackgroundImage(UIImage(data: data), forState: UIControlState.Normal)
                cell.posterImageButton.movie = self.movies[indexPath.item]
            }
        }
        
        return cell
    }
    
    // Implement methods for UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath) {
        // TODO: handle tap events in this method
        print("You selected cell #\(indexPath.item)!")
    }
    
    // Summary: This method handles the event when a
    //          resultPosterImage is tapped.
    // Post-Condition: UI navigates to MovieInfoViewController
    @IBAction func posterImageButtonTapped(sender: MovieButton) {
        // 1. Declare a MovieInfoViewController object called movieInfoViewController
        // 2. Set movieInfoViewController's movie to the MovieButton's movie
        // 3. Navigate to movieInfoViewController
        log("recPosterImage was tapped")
        let movieInfoViewController: MovieInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MovieInfoViewController") as! MovieInfoViewController
        movieInfoViewController.movie = sender.movie!
        self.navigationController?.showViewController(movieInfoViewController, sender: sender)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        acd.doViewLikes("clarissavazquez") {(result: [Dictionary<String, String>]) -> Void in
            var movies = [Movie]()
            
            for movie in result {
                movies.append(Movie(details: movie))
            }
            
            // TODO: Handle empty movies
            
            // Handle empty list of movies
            if(!movies.isEmpty) {
                log("Movie Results: \(String(movies))")
                self.movies = movies
            } else {
                log("No results.")
                // 1. Declare a NoResultsViewController called noResultsViewController
                // 2. Set noResultsViewController's movie list to the movie list generated in this method
                // 3. Navigate to noResultsViewController
                let noResultsViewController: NoResultsViewController =
                    self.storyboard?.instantiateViewControllerWithIdentifier("NoResultsViewController")
                        as! NoResultsViewController
                self.navigationController?.showViewController(noResultsViewController, sender: nil)
            }
        }
        
        log("Movie Results: \(String(movies))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}