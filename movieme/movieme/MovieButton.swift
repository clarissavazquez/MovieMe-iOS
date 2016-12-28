/**
 *  MovieButton.swift
 *
 *  MovieButton extends a regular UIButton and adds a Movie object 
 *  to button. Each button needs to have a movie associated with it
 *  so that in the case that it is tapped, movie info will be sent 
 *  to MovieInfoViewController
 */

import UIKit

class MovieButton: UIButton {
    var movie: Movie?
}
