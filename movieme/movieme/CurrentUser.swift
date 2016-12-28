//
//  CurrentUser.swift
//  movieme
//
//  Created by psycho on 12/22/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import Foundation

class CurrentUser: User {
    private static var instance: CurrentUser?

    private init(cinfo: [String: String]) {
        super.init(info: cinfo)

        //  TODO: store friends and movies
    }

    static func getInstance(cinfo: [String: String]) -> CurrentUser {
        if let instance = instance {
            return instance
        }

        instance = CurrentUser(cinfo: cinfo)
        return instance!
    }

    static func getInstance() -> CurrentUser? {
        if let instance = instance {
            return instance
        }

        return nil
    }
}