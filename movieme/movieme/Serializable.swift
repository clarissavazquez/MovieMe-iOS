/**
 *  Serializable.swift
 *  
 *  blah blah blah
 */

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