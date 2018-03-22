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
        Question(q: "What is 1 + 1?", a: [Answer(a:"1", c: false), Answer(a:"1", c: false), Answer(a:"1", c: false), Answer(a:"2", c: true)])
                    ]
    var score = Int();
    var currentQuestion = Int();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        loadQuestion();
    }
    
    @IBOutlet var questionLabel: UILabel!;
    
    @IBOutlet var answerA: UIButton!;
    @IBOutlet var answerB: UIButton!;
    @IBOutlet var answerC: UIButton!;
    @IBOutlet var answerD: UIButton!;
    
    func loadQuestion(){
        questionLabel.text = questions[currentQuestion].question;
        answerA.setTitle(questions[currentQuestion].answers[0].answer, for: .normal)
        answerB.setTitle(questions[currentQuestion].answers[1].answer, for: .normal)
        answerC.setTitle(questions[currentQuestion].answers[2].answer, for: .normal)
        answerD.setTitle(questions[currentQuestion].answers[3].answer, for: .normal)
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
