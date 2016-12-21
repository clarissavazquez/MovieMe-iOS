//
//  APICall.swift
//  movieme
//
//  Created by psycho on 12/18/16.
//  Copyright © 2016 movieme. All rights reserved.
//
import Foundation

//  The APICall protocol implements the logic to create the URL, 
//  run the query on a background thread and deserialize the JSON.
protocol APICall {
    var path: String {get}
    var url: NSURL? {get}
}

extension APICall {
    //  params: dictionary of unique parameter names mapped to values.
    //          ["title": "star wars", ...]
    //  summary: this method creates an NSURL given some parameters.
    //           the scheme and host are raw values. the path must be
    //           set in classes that conform to this protocol.
    func setup(params: [String:String]?) -> NSURL? {
        let urlcomponents = NSURLComponents()
        urlcomponents.scheme = "http"
        urlcomponents.host = "35.160.154.211"
        urlcomponents.port = 8080
        urlcomponents.path = path

        if let params = params {
            urlcomponents.queryItems = []
            for (key, value) in params {
                let param = NSURLQueryItem(name: key, value: value)
                urlcomponents.queryItems?.append(param)
            }
        } else {
            // no parameters given
        }

        return urlcomponents.URL
    }
    
    //  summary: this method creates a background queue on which the
    //           query can be run.
    func doInBackground(callback: (([Dictionary<String, String>]) -> Void)?) {
        let backgroundqueue = dispatch_queue_create("\(#file)", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_async(backgroundqueue) {
            guard let url = self.url else {
                log("URL is nil")
                return
            }
            
            let urlrequest = NSURLRequest(URL:url)
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            
            let task = session.dataTaskWithRequest(urlrequest, completionHandler: {(data, _, error) in
                do {
                    guard error == nil else {
                        log(String(error))
                        return
                    }

                    if let data = data {
                        let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                        dispatch_async(dispatch_get_main_queue(), {
                            callback?(json as! [Dictionary<String, String>])
                            return
                        })
                    }

                } catch {
                    // TODO: handle errors
                    log("Error")
                }
            })
            
            task.resume()
        }
    }
}