//
//  StoryBank.swift
//  Destini
//
//  Created by Julien Shim on 12/5/18.
//  Copyright © 2018 Julien Shim. All rights reserved.
//

import Foundation

class StoryBank {
    
    let pause = "$$$$$$$$$$$$$$$$$$$$"
    
    var list = [Story]()
    
    init() {
        
        // Story 1
        list.append(Story(text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception.\(pause) You decide to hitchhike.\(pause) A rusty pickup truck rumbles to a stop next to you.\(pause) A man with a wide brimmed hat and souless eyes opens the passenger door for you$ and you says, \"Need a ride, boy?\"", a: "I'll hop in. Thanks for the help!", b: "Well, I don't have many options. Better ask him if he's a murderer."))
        
        // Story 2
        list.append(Story(text: "He nods slowly, unphased by the question.", a: "At least he's honest. I'll climb in.", b: "Wait, I know how to change a tire."))
        
        // Story 3
        list.append(Story(text: "As you begin to drive, the stranger starts talking about his relationship with his mother.\(pause) He gets angrier and angrier by the minute.\(pause) He asks you to open the glove box.\(pause) Inside you find a bloody knife, two severed fingers, and a casette tape of Elton John.\(pause) He reaches for the glove box.", a: "I love Elton John! Hand him the cassette tape.", b: "It's him or me. Take the knife and stab him."))
        
        // Story 4
        list.append(Story(text: "What?\(pause) Such a copy out!\(pause) Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?", a: "", b: ""))
        
        // Story 5
        list.append(Story(text: "As you smash through the guardrail and careen toward the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", a: "", b: ""))
        
        // Story 6
        list.append(Story(text: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\".\(pause) He drops you off at the next town.\(pause) Before you go he asks if you know any good places to dump bodies.\(pause) You reply: \"Try the pier.\"", a: "", b: ""))
        
    }
    
}
