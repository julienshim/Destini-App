//
//  ViewController.swift
//  Destini
//
//  Created by Julien Shim on 12/5/18.
//  Copyright © 2018 Julien Shim. All rights reserved.
//

import UIKit

extension String {
    
    var characterArray: [Character]{
        var characterArray = [Character]()
        for character in self {
            characterArray.append(character)
        }
        return characterArray
    }
    
}

extension UITextView {
    
    func typeOn(string: String) {
        let characterArray = string.characterArray
        var characterIndex = 0
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if characterArray[characterIndex] != "$" {
                while characterArray[characterIndex] == " " {
                    self.text.append(" ")
                    characterIndex += 1
                    if characterIndex == characterArray.count {
                        timer.invalidate()
                        return
                    }
                }
                self.text.append(characterArray[characterIndex])
            }
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
            }
        }
    }
}

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restart()
        updateUI()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userChoice = sender.tag
        if userChoice == 1 || userChoice == 2 {
            storyBrain.nextStory(userChoice: userChoice)
        } else {
            restart()
        }
        updateUI()
    }
    
    func updateUI () {
        hideButtons()
        updateButtons()
        typeStory()
    }
    
    func showButtons(choice: Bool, restart: Bool) {
        let showButtonDelay = Double(storyBrain.getStoryTextLength()) * 0.049;
        DispatchQueue.main.asyncAfter(deadline: .now() + showButtonDelay) {
            self.topButton.isHidden = choice
            self.bottomButton.isHidden = choice
            self.restartButton.isHidden = restart
        }
    }
    
    func hideButtons() {
        topButton.isHidden = true;
        bottomButton.isHidden = true;
    }
    
    func updateButtons() {
        
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
        
        let (choiceA, choiceB) = storyBrain.getChoices()
        topButton.setTitle(choiceA, for: .normal)
        bottomButton.setTitle(choiceB, for: .normal)

        let storyHasEnded = storyBrain.hasStoryEnded()
        
        if storyHasEnded {
            showButtons(choice: true, restart: false)
        } else {
            showButtons(choice: false, restart: true)
        }
    }
    
    func typeStory() {
        storyTextView.text = ""
        let storyText = storyBrain.getStoryText()
        storyTextView.typeOn(string: storyText)
    }
    
    func restart() {
        storyBrain.storyIndex = 0
        restartButton.isHidden = true
    }
    
}
