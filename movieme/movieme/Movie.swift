/**
 *  Movie.swift
 */

import Foundation

class Movie: Serializable {
    var POSTER = ""
    var TITLE = ""
    var DIRECTOR = ""
    var WRITER = ""
    var RELEASED = ""
    var IMDBID = ""
    var RATING = ""
    var RATED = ""
    var ACTORS = ""
    var GENRE = ""
    var RUNTIME = ""
    var PLOT = ""
    override var description: String { return TITLE }

    init(details: Dictionary<String, String>) {
        super.init(json: details)
        log("complete: \(self.TITLE)")
    }
}