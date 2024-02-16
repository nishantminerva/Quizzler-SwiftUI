//
//  Question.swift
//  Quizzler
//
//  Created by Nishant Minerva on 16/02/24.
//

import Foundation


struct Question {
    let text : String
    let answer : String
    
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
