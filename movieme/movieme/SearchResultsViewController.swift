//
//  SearchResultsViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var movies = [Movie]()
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // Tell collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    // Make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        if let url = NSURL(string: self.movies[indexPath.item].POSTER) {
            if let data = NSData(contentsOfURL: url) {
                cell.resultPosterImage.setBackgroundImage(UIImage(data: data), forState: UIControlState.Normal)
                cell.resultPosterImage.movie = self.movies[indexPath.item]
            }
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    // Handle result poster image tapped
    @IBAction func resultPosterImageTapped(sender: MovieButton) {
        let movieInfoViewController: MovieInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MovieInfoViewController") as! MovieInfoViewController
        movieInfoViewController.movie = sender.movie
        self.navigationController?.showViewController(movieInfoViewController, sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

