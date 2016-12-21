//
//  HomeViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/19/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var movies = [Movie]()
    var movie = Movie(details: Dictionary<String, String>())
    
    
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
                cell.recPosterImage.setBackgroundImage(UIImage(data: data), forState: UIControlState.Normal)
                cell.recPosterImage.movie = self.movies[indexPath.item]
            }        
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    @IBAction func recPosterImageTapped(sender: MovieButton) {
        log("recPosterImage was tapped")
        let movieInfoViewController: MovieInfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MovieInfoViewController") as! MovieInfoViewController
        movieInfoViewController.movie = sender.movie
        self.navigationController?.showViewController(movieInfoViewController, sender: sender)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movie.POSTER = "http://a.dilcdn.com/bl/wp-content/uploads/sites/6/2015/10/star-wars-force-awakens-official-poster.jpg"
        movies.append(movie)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
