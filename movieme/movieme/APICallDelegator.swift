/**
 *  APICallDelegator.swift
 *
 *  The APICallDelegator wraps functionality for all APICall delegates.
 *  These wrapper methods can have any number of parameters necessary
 *  to make a successful request and must have an optional callback
 *  through which the results can be sent.
 */

import Foundation

class APICallDelegator {

    //  title: the pattern to search for in Movie titles.
    //  callback: the method through which the results are sent.
    //  summary: this method searches for some pattern in the
    //           titles of Movies.
    func doSearchForMovie(title: String, callback: (([Dictionary<String,String>]) -> Void)?) {
        let searchdelegate = SearchDelegate()
        let backgroundqueue = dispatch_queue_create("\(#file)", DISPATCH_QUEUE_CONCURRENT)

        dispatch_async(backgroundqueue) {
            if let url = searchdelegate.setup(["property":"title", "value":title]) {
                searchdelegate.execute(url, callback: callback)
            }
        }
    }
    
    func doViewLikes(userid: String, callback: (([Dictionary<String,String>]) -> Void)?) {
        let viewlikesdelegate = ViewLikesDelegate()
        let backgroundqueue = dispatch_queue_create("\(#file)", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_async(backgroundqueue) {
            if let url = viewlikesdelegate.setup(["userid":userid]) {
                viewlikesdelegate.execute(url, callback: callback)
            }
        }
    }
    
    func doUserLikesMovie(userid: String, imdbid: String, callback: (([Dictionary<String,String>]) -> Void)?) {
        let userlikesdelegate = UserLikesDelegate()
        let backgroundqueue = dispatch_queue_create("\(#file)", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_async(backgroundqueue) {
            if let url = userlikesdelegate.setup(["userid":userid, "imdbid":imdbid]) {
                userlikesdelegate.execute(url, callback: callback)
            }
        }
    }
    
    func doUserUnikesMovie(userid: String, imdbid: String, callback: (([Dictionary<String,String>]) -> Void)?) {
        let userunlikesdelegate = UserUnlikesDelegate()
        let backgroundqueue = dispatch_queue_create("\(#file)", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_async(backgroundqueue) {
            if let url = userunlikesdelegate.setup(["userid":userid, "imdbid":imdbid]) {
                userunlikesdelegate.execute(url, callback: callback)
            }
        }
    }
}