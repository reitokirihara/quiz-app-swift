//
//  ScoreViewController.swift
//  quiz-app-reito
//
//  Created by UCode on 3/21/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import Foundation
import UIKit

class ScoreViewController: UIViewController {
    var score:Int!
    var highScore: Int = 0;
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        scoreLabel.text = String(score)
        
        if score > highScore {
            highScore = score;
        }
        
        highScoreLabel.text = String(highScore)
    }
    
}
