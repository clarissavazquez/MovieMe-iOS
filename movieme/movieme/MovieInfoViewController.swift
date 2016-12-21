/**
 *  MovieInfoViewController.swift
 *  
 *  Sets the view with all movie information.
 */

import UIKit

class MovieInfoViewController: UIViewController {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var rated: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var actors: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var movie = Movie(details: Dictionary<String, String>())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        log("Movie: \(String(movie))")
        
        // Set all labels and poster image
        if let url = NSURL(string: self.movie.POSTER) {
            if let data = NSData(contentsOfURL: url) {
                posterImage.image = UIImage(data: data)
            }
        }
        movieTitle.text = movie.TITLE
        movieDescription.text = movie.PLOT
        rated.text = movie.RATED
        runtime.text = movie.RUNTIME
        genre.text = movie.GENRE
        director.text = "Directed by \(String(movie.DIRECTOR))"
        actors.text = "Actors: \(String(movie.ACTORS))"
        rating.text = "\(String(movie.RATING)) / 10"
        
        // Adjust sizes
        movieTitle.adjustsFontSizeToFitWidth = true
        movieDescription.sizeToFit()
        rated.adjustsFontSizeToFitWidth = true
        runtime.adjustsFontSizeToFitWidth = true
        genre.adjustsFontSizeToFitWidth = true
        director.adjustsFontSizeToFitWidth = true
        actors.adjustsFontSizeToFitWidth = true
        rating.adjustsFontSizeToFitWidth = true
        
        // TODO: Set button label to like/unlike according to user's 
        //       relationship with movie
        // if movie liked by user
        //     button = unlike
        // else
        //     button = like
    }

    @IBAction func likeButtonTapped(sender: UIButton) {
        // TODO: Change condition
        if(sender.titleLabel!.text == "Like") {
            // TODO: Make correct API calls to like self.movie
            
            // Set button's label to "Unlike"
            sender.setTitle("Unlike", forState: UIControlState.Normal)
            log("Liked \(String(self.movie))")
        } else {
            // TODO: Make correct API calls to unlike self.movie
            
            // Set button's label to "Like"
            sender.setTitle("Like", forState: UIControlState.Normal)
            log("Unliked \(String(self.movie))")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
