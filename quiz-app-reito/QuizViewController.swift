//
//  QuizViewController.swift
//  quiz-app-reito
//
//  Created by UCode on 3/21/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    var questions = [
        Question(q: "Why?", a: [Answer(a:"no", c: false), Answer(a:"no", c: false), Answer(a:"no", c: false), Answer(a:"yes", c: true)]),
        Question(q: "What is 1 + 1?", a: [Answer(a:"1", c: false), Answer(a:"1", c: false), Answer(a:"1", c: false), Answer(a:"2", c: true)]),
        Question(q: "What is 2 + 2?", a: [Answer(a:"4", c: true), Answer(a:"100 in base 2", c: true), Answer(a:"1", c: false), Answer(a:"10", c: false)])
                    ]
    var score = Int();
    var currentQuestion = Int();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        score = 0;
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        loadQuestion();
    }
    
    @IBOutlet var questionLabel: UILabel!;
    
    @IBOutlet var answerA: UIButton!;
    @IBOutlet var answerB: UIButton!;
    @IBOutlet var answerC: UIButton!;
    @IBOutlet var answerD: UIButton!;
    
    func loadQuestion(){
        answerA.alpha = 0;
        answerB.alpha = 0;
        answerC.alpha = 0;
        answerD.alpha = 0;
        questionLabel.text = questions[currentQuestion].question;
        questionLabel.sizeToFit();
        answerA.setTitle(questions[currentQuestion].answers[0].answer, for: .normal)
        answerB.setTitle(questions[currentQuestion].answers[1].answer, for: .normal)
        answerC.setTitle(questions[currentQuestion].answers[2].answer, for: .normal)
        answerD.setTitle(questions[currentQuestion].answers[3].answer, for: .normal)
        answerA.sizeToFit()
        answerB.sizeToFit()
        answerC.sizeToFit()
        answerD.sizeToFit()
        UIView.animate(withDuration: 1, delay: 0, options: [.curveLinear], animations: {
            self.answerA.alpha = 1;
            self.answerB.alpha = 1;
            self.answerC.alpha = 1;
            self.answerD.alpha = 1;
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func answerQuestion(_ sender: AnyObject){
        if questions[currentQuestion].answers[sender.tag].isCorrect {
            score += 1
        }
        currentQuestion += 1
        if currentQuestion >= questions.count {
            performSegue(withIdentifier: "scoreScreen", sender: nil)
        }else{
            loadQuestion()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scoreScreen" {
            let controller = segue.destination as! ScoreViewController
            controller.score = score        }
    }
}
