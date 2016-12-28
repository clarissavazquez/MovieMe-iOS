//
//  LikesViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/27/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
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
        self.collectionView.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.movies = CurrentUser.getInstance()!.MOVIES!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}