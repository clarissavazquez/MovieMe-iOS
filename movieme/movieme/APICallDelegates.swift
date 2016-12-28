/**
 *  SearchDelegate.swift
 *
 */

import Foundation

class SearchDelegate: APICall {
    let path = "/movie/search"
}

class LikeDelegate: APICall {
    let path = "/user/likes"
}

class UnlikeDelegate: APICall {
    let path = "/user/unlikes"
}

class ViewLikesDelegate: APICall {
    let path = "/user/view_likes"
}

class RecommendationDelegate: APICall {
    let path = "/user/recommendations"
}
