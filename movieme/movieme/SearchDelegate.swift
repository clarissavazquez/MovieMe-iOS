//
//  SearchDelegate.swift
//  movieme
//
//  Created by psycho on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//
import Foundation

//  The SearchDelegate class conforms to the APICall protocol.
//  Through this class, the MovieMe search API can be called.
class SearchDelegate: APICall {
    let path: String = "/movie/search"
    var url: NSURL?
    var result: [Movie]?

    //  params: dictionary of unique parameter names mapped to values.
    //          ["title": "star wars", ...]
    //  summary: this method executes the APICall setup and verifies 
    //           the URL is not nil.
    func setup(params: [String:String]?) {
        guard let url = (self as APICall).setup(params) else {
            log("URL is nil")
            return
        }
        
        self.url = url
    }

    //  summary: this method executes the APICall doInBackground and
    //           provides the callback method.
    func doInBackground(callback: ([Dictionary<String, String>]?)->()) {
        (self as APICall).doInBackground(callback)
    }
}