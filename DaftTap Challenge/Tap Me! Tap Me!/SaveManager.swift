//
//  SaveManager.swift
//  Tap Me! Tap Me!
//
//  Created by Axel Hirszson on 5/12/19.
//  Copyright © 2019 Axel Hirszson. All rights reserved.
//

import Foundation


class SaveManager {

    static var playerScoreKey = "playerScoreKey"
    static var dateLoggedKey = "dateLoggedKey"
    //let historicalGameData = "historicalGameDataKey"
    
    static func saveResults(playerScore:Int, dateLogged:Double) {
        
        // Create user defaults instance
        let defaults = UserDefaults.standard
        
        //defaults.set(playerScore, forKey: "playerScoreKey")
        //defaults.set(dateLogged, forKey: "dateLoggedKey")
        
        // User defaults key
        let historicalGameDataKey = "historicalGameData"
        
        // Fetch game data array
        var historicalGameData = defaults.array(forKey: historicalGameDataKey)
        
        // Create array if it is nil (i.e. very first game)
        if historicalGameData == nil {
            historicalGameData = []
        }
        
        // Create game data dictionary
        let gameData = [
            "playerScore": playerScore,
            "dateLogged": dateLogged
            ] as [String : Any]
        
        // Append game data dictionary to the array
        historicalGameData?.append(["playerScore": gameData])
        
        // Save the updated array
        defaults.set(historicalGameData, forKey: historicalGameDataKey)
        
    }
    
    
}


