//
//  TipsAndTricksModel.swift
//  App
//
//  Created by Janco Erasmus on 2020/04/07.
//

import Foundation
import Vapor

//info: https://mashable.com/article/12-iphone-11-pro-camera-tips/
struct TipsAndTricksModel : Content {
    var tipID: Int
    var heading: String
    var body: String
    var status: String
}
