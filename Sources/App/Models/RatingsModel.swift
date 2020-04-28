//
//  RatingsModel.swift
//  App
//
//  Created by Janco Erasmus on 2020/04/28.
//

import Foundation
import Vapor

struct NewRating: Content {
    var ratingID: Int
    var rating: Int
}

struct Ratings: Content {
    var ratings: [RatingsModel]
}

struct RatingsModel: Content, Encodable {
    var ratingID: Int
    var lastRating: Int
    var veryBadNumberOfRatings: Int
    var badNumberOfRatings: Int
    var okayNumberOfRatings: Int
    var goodNumberOfRatings: Int
    var veryGoodNumberOfRatings: Int
    var overallRating: Int
}
