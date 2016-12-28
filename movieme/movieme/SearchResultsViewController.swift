/**
 *  SearchResultsViewController.swift
 *
 *  blah blah blah
 */

import UIKit

class SearchResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let reuseIdentifier = "cell"
    var movies = [Movie]()
    
    
    // Implements methods for UICollectionViewDataSource protocol
    
    // Tell collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    // Make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        cell.posterImageButton.movie = nil
        
        // Use the outlet in our custom class to get a reference to the UIButton in the cell
        // and set its background image to the current movie's poster.
        if let url = NSURL(string: self.movies[indexPath.item].POSTER) {
            if let data = NSData(contentsOfURL: url) {
                cell.posterImageButton.setBackgroundImage(UIImage(data: data), forState: UIControlState.Normal)
                cell.posterImageButton.movie = self.movies[indexPath.item]
            }
        }
        
        return cell
    }
    
    // Implements methods for UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    // Summary: This method handles the event when a 
    //          resultPosterImage is tapped.
    // Post-Condition: UI navigates to MovieInfoViewController
    @IBAction func posterImageTapped(sender: MovieButton) {
        // 1. Declare a MovieInfoViewController object called movieInfoViewController
        // 2. Set movieInfoViewController's movie to the MovieButton's movie
        // 3. Navigate to movieInfoViewController
        let movieInfoViewController: MovieInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MovieInfoViewController") as! MovieInfoViewController
        movieInfoViewController.movie = sender.movie!
        self.navigationController?.showViewController(movieInfoViewController, sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

