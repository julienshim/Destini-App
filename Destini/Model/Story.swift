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
    
    init(text: String, a: String, b: String) {
        self.storyText = text
        self.choiceA = a
        self.choiceB = b
    }
    
}
