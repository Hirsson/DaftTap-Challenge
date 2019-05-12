//
//  RankingViewController.swift
//  Tap Me! Tap Me!
//
//  Created by Axel Hirszson on 5/11/19.
//  Copyright © 2019 Axel Hirszson. All rights reserved.
//

import UIKit
import QuartzCore

class LeaderboardViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stackViewTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rootStackView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var playGameButton: UIButton!
    
    
    var resultVC:LeaderboardViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // playGame button look
        playGameButton.layer.borderColor = UIColor.black.cgColor
        playGameButton.layer.borderWidth = 0.5
        playGameButton.layer.cornerRadius = 10.0
        // playGameButton.clipsToBounds = YES
        
        //        // Set up gamePlay view controller
        //        resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? LeaderboardViewController
        //        resultVC?.delegate = self
        //        resultVC?.modalPresentationStyle = .overCurrentContext
        //
        //        // Conform to the table view protocols
        //        // MARK: tableView.dataSource = self
        //        tableView.delegate = self
        //
        //        // Configure the tableview for dynamic row height
        //        tableView.estimatedRowHeight = 100
        //        tableView.rowHeight = UITableView.automaticDimension
        //
        //        // Set self as delagate for model and call get questions
        //        // delegate = self
        //        // getUserDefaults()
        //        resultVC.self
    }
    
    // MARK: Animate Leaderboard stackView sliding into view
    func slideInRootStackView() {
        
        // Set the starting state
        rootStackView.alpha = 0
        stackViewLeadingConstraint.constant = 1000
        stackViewTrailingConstraint.constant = -1000
        view.layoutIfNeeded()
        
        // Animate to the ending state
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            self.rootStackView.alpha = 1
            self.stackViewLeadingConstraint.constant = 0
            self.stackViewTrailingConstraint.constant = 0
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    // MARK: Animate Leaderboard stackView sliding out of view
    func slideOutRootStackView() {
        
        // Set the starting state
        rootStackView.alpha = 1
        stackViewLeadingConstraint.constant = 0
        stackViewTrailingConstraint.constant = 0
        view.layoutIfNeeded()
        
        // Animate to the ending state
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseIn, animations: {
            
            self.rootStackView.alpha = 0
            self.stackViewLeadingConstraint.constant = -1000
            self.stackViewTrailingConstraint.constant = 1000
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    // Navigate to Gameplay view controller
    @IBAction func playGame(_ sender: UIButton) {
        
        // MARK: Play the slide in/slide out sound. Find different sound.
        //SoundManager.playSound(.slideInScreen)
        
    }
    
}


