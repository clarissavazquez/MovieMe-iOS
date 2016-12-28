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

    private override init(info: [String: String]) {
        super.init(info: info)

        //  TODO: store friends and movies
    }

    static func setInstance(info: [String: String]) -> CurrentUser {
        if let instance = instance {
            return instance
        }

        instance = CurrentUser(info: info)
        return instance!
    }

    static func getInstance() -> CurrentUser? {
        if let instance = instance {
            return instance
        }

        return nil
    }
}