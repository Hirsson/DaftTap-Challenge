//
//  ViewController.swift
//  Tap Me! Tap Me!
//
//  Created by Axel Hirszson on 5/10/19.
//  Copyright © 2019 Axel Hirszson. All rights reserved.
//

import UIKit
import QuartzCore

// MARK: Comunication protocol GameplayViewController and UserDefaults
protocol GameplayViewControllerProtocol {
    
    
    
}

class GameplayViewController: UIViewController, GameplayViewControllerProtocol {
    
    var score = 0
    var timer: Timer?
    var miliseconds:Float = 5 * 1000
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var patDoggy: UIButton!
    
    var delegate:GameplayViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // timeLabel look
        //timeLabel.layer.borderColor = UIColor.white.cgColor
        //timeLabel.layer.borderWidth = 1.0
        //timeLabel.layer.cornerRadius = 10.0
        
        // scoreLabel look
        //scoreLabel.layer.borderColor = UIColor.black.cgColor
        //scoreLabel.layer.borderWidth = 2.0
        //scoreLabel.layer.cornerRadius = 10.0
        
        // playGame button look
        patDoggy.layer.borderColor = UIColor.black.cgColor
        patDoggy.layer.borderWidth = 0.2
        patDoggy.layer.cornerRadius = 10.0
        
        // Create Timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(subtractTime), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
        
    }
    
    // MARK: navigate to parent view controller
    //    func navigateToParent(source: GameplayViewController, destination: LeaderboardViewController)
    //    {
    //        // Navigate backward (dismissing)
    //        source.dismiss(animated: true, completion: nil)
    //
    //    }
    
    
    // Timer Methods
    @objc func subtractTime() {
        
        // seconds = seconds - 1
        miliseconds -= 1
        
        // Convert to seconds
        let seconds = String(format: "%.2f", miliseconds/1000)
        
        // Set Label
        timeLabel.text = "Time Remaining: \(seconds)"
        
        // When the timer reached 0...
        if miliseconds <= 0 {
            timer?.invalidate()
            timeLabel.textColor = UIColor.red
            
            
            
            // Show results summary
            let alert = UIAlertController(title: "ULALA !", message: "You have patted doggy \(score) times! Doggy is very happy.", preferredStyle: .alert)
            // let alert = UIAlertController(title: "Game Over", message: "You have scored \(score) points.", preferredStyle: .actionSheet)
            
            let action = UIAlertAction(title: "See leaderboard", style: .default, handler: { (action) in
                
                // Play sound at action tap
                SoundManager.playSound(.singleBark)
                
                // Dismiss present view controller
                self.dismiss(animated: true, completion: nil)
                
            })
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            // TODO: Save results
          
            
        }
    }
    
    // Update score after buttonTapped
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        score = score + 1
        scoreLabel.text = "Times Patted\n \(score)"
        
        // MARK: Play sound at tap
        SoundManager.playSound(.singleBark)
        
        // TODO: Animate button's backgroundImage size increase and decrease when tapped
    }
    
    
}
