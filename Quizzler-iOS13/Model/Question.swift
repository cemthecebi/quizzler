//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Cem Çebi on 16.05.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text:String;
    let answer:[String];
    let correctAnswer:String;
    
    init(q: String, a: [String], correctAnswer: String){
        self.text = q;
        self.answer = a;
        self.correctAnswer = correctAnswer;
    }
}
