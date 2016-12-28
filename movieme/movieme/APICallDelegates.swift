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

class RecommendationDelegate: APICall {
    let path = "/user/recommendations"
}