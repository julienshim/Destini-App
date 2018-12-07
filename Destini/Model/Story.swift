//
//  Story.swift
//  Destini
//
//  Created by Julien Shim on 12/5/18.
//  Copyright © 2018 Julien Shim. All rights reserved.
//

import Foundation

class Story {
    
    let storyText : String
    let choiceA : String
    let choiceB : String
    let pause : Int
    
    init(text: String, a: String, b: String, p: Int) {
        storyText = text
        choiceA = a
        choiceB = b
        pause = p
    }
    
}
