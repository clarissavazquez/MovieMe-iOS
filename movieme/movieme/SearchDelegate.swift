//
//  SearchDelegate.swift
//  movieme
//
//  Created by psycho on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//
import Foundation

class SearchDelegate: APICall {
    let log: String = "SearchDelegate"
    var path: String
    var url: NSURL?

    init() {
        self.path = "/movie/search?"
    }

    func setup(params: [String:String]?) {
        print(log, "setup")
        
        if let _url = (self as APICall).setup(params) {
            self.url = _url
            
            print(log, self.url!)
        } else {
            print(log, "ERROR")
        }
    }

    func doInBackground() -> Any? {
        print(log, "doInBackground")
        
        return (self as APICall).doInBackground()
    }
}