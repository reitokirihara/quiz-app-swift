//
//  Question.swift
//  quiz-app-reito
//
//  Created by UCode on 3/21/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import Foundation

class Question{
    let question: String;
    let answers: [Answer];
    
    init(q:String, a:[Answer]){
        question = q;
        answers = a;
    }
}
