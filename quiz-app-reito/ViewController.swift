//
//  ViewController.swift
//  quiz-app-reito
//
//  Created by UCode on 3/21/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startButton:UIButton!
    @IBOutlet var startButtonCenterConstraint:NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let screenWidth = view.frame.width
        startButtonCenterConstraint.constant = -screenWidth
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear], animations: {
            self.startButtonCenterConstraint.constant = 0
            self.view.layoutIfNeeded()
            print(self.startButtonCenterConstraint.constant)
        })
    }

}

