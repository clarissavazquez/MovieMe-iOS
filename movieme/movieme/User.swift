//
//  User.swift
//  movieme
//
//  Created by psycho on 12/21/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import Foundation

class User: Serializable {
    var USERID = ""
    var NAME = ""
    var EMAIL = ""
    var PHOTO_URI = ""
    var FRIENDS: [User]?
    var MOVIES: [Movie]?

    init(info: Dictionary<String, String>) {
        super.init(json: info)
        log("complete \(self.NAME)")
    }
}