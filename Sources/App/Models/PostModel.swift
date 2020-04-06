//
//  PostModel.swift
//  App
//
//  Created by Janco Erasmus on 2020/04/06.
//

import Foundation
import Vapor

struct PostModel: Content {
    var name: String
    var surname: String
    var greet: String
}

struct PostModelBody: Content {
    var name: String
    var surname: String
}
