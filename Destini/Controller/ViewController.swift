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
    
    let allStories = StoryBank()
    var storyIndex = 0;


    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if(sender.tag == 1) {
            if(storyIndex == 0 || storyIndex == 1) {
                storyIndex = 2
            } else {
                storyIndex = 5
            }
            updateUI()
        } else {
            if(storyIndex == 0) {
                storyIndex = 2
            } else if (storyIndex == 1) {
                storyIndex = 3
            } else if (storyIndex == 2) {
                storyIndex = 5
            }
            updateUI()
        }
        
    }
    
    func updateUI () {
        
        topButton.isHidden = true;
        bottomButton.isHidden = true;
        
        storyTextView.text = ""
        storyTextView.typeOn(string: allStories.list[storyIndex].storyText)
    
        
        // Attributed Styling
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
            
        ]
        
        // Normally setTitle, but UIButton multi-line and centering
        
        topButton.setAttributedTitle(NSAttributedString(string: allStories.list[storyIndex].choiceA, attributes: attributes), for: .normal)
        bottomButton.setAttributedTitle(NSAttributedString(string: allStories.list[storyIndex].choiceB, attributes: attributes), for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (Double(allStories.list[storyIndex].storyText.count) * 0.05 - Double(allStories.list[storyIndex].pause)*0.70)) {
            self.topButton.isHidden = false;
            self.bottomButton.isHidden = false;
        }
        
    }

    
    
}

