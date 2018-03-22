//
//  Answer.swift
//  quiz-app-reito
//
//  Created by UCode on 3/21/18.
//  Copyright © 2018 UCode. All rights reserved.
//

import Foundation

class Answer{
    let answer: String
    let isCorrect: Bool
    
    init(a:String, c:Bool){
        answer = a;
        isCorrect = c;
    }
}
