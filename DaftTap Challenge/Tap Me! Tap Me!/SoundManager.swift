//
//  SoundManager.swift
//  Tap Me! Tap Me!
//
//  Created by Axel Hirszson on 5/12/19.
//  Copyright © 2019 Axel Hirszson. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        
        case singleBark
        
        case slideInScreen
      
       
    }
    
    static func playSound(_ effect:SoundEffect) {
        
        var soundFilename = ""
        

        // Set appropriate filename
        switch effect {
            
        case .singleBark:
            soundFilename = "singleBark"
            
        case .slideInScreen:
            soundFilename = "slideInScreen"
            
            
            //default:
            //    soundFilename = ""
            
        }
        
        // Get the path to sound path inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "mp3" )
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
            
        }
        
        // Create URL object from string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
            
        }
        catch {
            // Couldn't catch audio player object, log the error
            print("Coulnd't create audio player object for sound file \(soundFilename)")
        }
        
        
    }
    
}

