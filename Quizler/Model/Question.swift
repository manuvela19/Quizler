//
//  Question.swift
//  Quizler
//
//  Created by Manuvela on 22/01/24.
//

import Foundation

struct Question{
    let text : String
    let answer : String
    
    init(q : String, a : String){
        text = q
        answer = a
    }
}
