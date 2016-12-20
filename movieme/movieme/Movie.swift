//
//  Movie.swift
//  movieme
//
//  Created by psycho on 12/19/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import Foundation

class Movie: Serializable {
    var POSTER: String = ""
    var TITLE: String = ""
    var DIRECTOR: String = ""
    var WRITER: String = ""
    var RELEASED: String = ""
    var IMDBID: String = ""
    var RATING: String = ""
    var RATED: String = ""
    var ACTORS: String = ""
    var GENRE: String = ""
    var RUNTIME: String = ""
    var PLOT: String = ""

    init(details: Dictionary<String, String>) {
        super.init(json: details)
    }
}