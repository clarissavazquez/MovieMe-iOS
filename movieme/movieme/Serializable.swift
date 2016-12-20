//
//  Serializable.swift
//  movieme
//
//  Created by psycho on 12/19/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import Foundation

class Serializable: NSObject {    
    init(json: Dictionary<String, String>) {
        super.init()
        
        for (key, value) in json {
            if( self.respondsToSelector(NSSelectorFromString(key)) ) {
                self.setValue(value, forKey: key)
            } else {
                log("Error mapping JSON to object")
            }
        }
    }
}