//
//  TipsAndTricsController.swift
//  App
//
//  Created by Janco Erasmus on 2020/04/08.
//

import Foundation

class TipsAndTricsController {
    func changeStatusTried(model: TipsAndTricksModel) -> TipsAndTricksModel {
        var newModel = model
        newModel.status = "Tried"
        return newModel
    }
    
    func changeStatusNew(model: TipsAndTricksModel) -> TipsAndTricksModel {
        var newModel = model
        newModel.status = "New"
        return newModel
    }
}
