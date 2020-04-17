//
//  TipsAndTricksRepo.swift
//  App
//
//  Created by Janco Erasmus on 2020/04/07.
//

import Foundation
import Vapor

struct TipsAndTricksRepo: Content {
    var tipsAndTricksContent = [TipsAndTricksModel]()
    
    mutating func populateDictionaries() -> [TipsAndTricksModel]{
        let tipOne = TipsAndTricksModel(tipID: 1, heading: "Go ultra wide", body: "Both the iPhone 11 and 11 Pro have new ultra-wide cameras on the back. The 12-megapixel (f/2.2) camera is equivalent to a 13mm DSLR lens and has a 120-degree field of view, which is capable of fitting A LOT more in a shot.", status: "New")
        
        let tipTwo = TipsAndTricksModel(tipID: 2, heading: "Ultra-wide panoramas", body: "The ultra-wide camera also works for panoramas. Ultra-wide panoramas are way more distorted than with the wide lens, but, hey, if you want to do it, you can.", status: "New")
        
        let tipThree = TipsAndTricksModel(tipID: 3, heading: "Smarter selfies", body: "The iPhone 11 and 11 Pro both come with 12-megapixel front-facing cameras. However, you don't always get 12 megapixels for every selfie./nBy default, if you hold your iPhone 11 vertically, the image sensor zooms in to take a 7-megapixel selfie. Tap the expand button on the screen to zoom out for the full 12-megapixel camera.", status: "New")
        
        let tipFour = TipsAndTricksModel(tipID: 4, heading: "Aspect ratio = 16:9", body: "On earlier iPhones, you have two aspect ratios to choose from: 4:3 (rectangle) or 1:1 (square), both of which are their own shooting modes./nWith the new Camera app on iPhone 11 and 11 Pro, aspect ratio settings are grouped into a single mode, and there's a new 16:9 aspect ratio. To change the aspect ratio, swipe up on the screen to bring up a new row of camera settings.", status: "New")
        
        let tipFive = TipsAndTricksModel(tipID: 5, heading: "Video in photo mode", body: "On the new iPhone 11 and 11 Pro, there's a new QuickTake feature, which lets you record a video within photo mode by holding down the shutter button. If you've used Instagram Stories or Snapchat Stories before, it works exactly the same.", status: "New")
        
        let tipSix = TipsAndTricksModel(tipID: 6, heading: "Burst shooting is now a swipe", body: "For vertical photos, simply swipe left from the shutter button, and for horizontal photos, swipe down instead.", status: "New")
        
        let tipSeven = TipsAndTricksModel(tipID: 7, heading: "Using the volume buttons as shutter", body: "And speaking of shutter button behaviors that have changed: A single press on either volume button still takes a photo, but holding down either volume button doesn't shoot a burst of photos anymore and instead records a QuickTake video. There's no way to change this (I looked and it's not in the Settings app).", status: "New")
        
        let tipEight = TipsAndTricksModel(tipID: 8, heading: "Controlling Night mode", body: "The iPhone 11 and 11 Pro both have a Night mode function. Unlike on Android phones, where the mode is one you can select, Night mode on the iPhone 11 and 11 Pro kicks in automatically when the scene is dark./nA Night mode icon appears next to the flash icon and shows you how long you need to hold still for. Tap the shutter button and a meter will appear and count down from the recommended exposure time.", status: "New")
        
        let tipNine = TipsAndTricksModel(tipID: 9, heading: "Use a tripod to improve Night mode", body: "Night mode is great for long exposures that last only a few seconds. But if you really want to create the longest exposures, you're going to want to mount your iPhone 11 or 11 Pro to a tripod. The gyroscope detects whether the phone's perfectly still and then dials up the exposure time to as long as 30 seconds.", status: "New")
        
        let tipTen = TipsAndTricksModel(tipID: 10, heading: "Recompose photos and videos", body: "Within the Settings app under Camera, there's a section called Composition which lets you turn on Photos Capture Outside the Frame and Videos Capture Outside the Frame./nWith the composition setting turned on, shooting with the wide camera lets you recover a slightly wider field of view because when you press the shutter, it's actually also capturing an image from the ultra-wide camera.", status: "New")
        
        self.tipsAndTricksContent = [tipOne, tipTwo, tipThree, tipFour, tipFive, tipSix, tipSeven, tipEight, tipNine, tipTen]
        return self.tipsAndTricksContent
    }
}
