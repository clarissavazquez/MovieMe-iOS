//
//  APICall.swift
//  movieme
//
//  Created by psycho on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//
import Foundation

protocol APICall {
    var path: String {get}
}

extension APICall {
    func setup(params: [String:String]?) -> NSURL? {
        let urlcomponents = NSURLComponents()
        urlcomponents.scheme = "http"
        urlcomponents.host = "localhost:8080"
        urlcomponents.path = path
        
        if let _params = params {
            urlcomponents.queryItems = []
            for (key, value) in _params {
                let param = NSURLQueryItem(name: key, value: value)
                urlcomponents.queryItems?.append(param)
            }
        } else {
            // no parameters given
        }
        
        return urlcomponents.URL
    }
    
    func doInBackground() -> Any? {
        // TODO: create another thread to make API call
        return nil
    }
}