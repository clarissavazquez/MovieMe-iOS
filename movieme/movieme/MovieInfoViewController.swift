//
//  MovieInfoViewController.swift
//  movieme
//
//  Created by Clarissa Vazquez on 12/20/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class MovieInfoViewController: UIViewController {
    var movie = Movie(details: Dictionary<String, String>())
    @IBOutlet weak var posterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: self.movie.POSTER) {
            if let data = NSData(contentsOfURL: url) {
                posterImage.image = UIImage(data: data)
            }
        }
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
