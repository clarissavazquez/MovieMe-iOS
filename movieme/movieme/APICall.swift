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

        log("complete: \(String(urlcomponents.URL!))")
        return urlcomponents.URL
    }
    
    //  url: the target URL with a given set of parameters.
    //  callback: the method to which the results are passed through. 
    //  summary: this method takes an URL and optionally a callback
    //           method. it makes the request specified by the URL
    //           and passes the results to the callback method.
    func execute(url: NSURL, callback: (([Dictionary<String, String>]) -> Void)?) {
        let urlrequest = NSURLRequest(URL:url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(urlrequest, completionHandler: {(data, _, error) in
            do {
                guard error == nil else {
                    log("Error")
                    return
                }

                if let data = data {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [Dictionary<String, String>]

                    dispatch_async(dispatch_get_main_queue(), {
                        callback?(json)
                        return
                    })
                }
            } catch {
                // TODO: handle errors
                log("Error")
                return
            }
        })
        
        task.resume()
    }
}