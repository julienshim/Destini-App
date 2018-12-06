//
//  ViewController.swift
//  Destini
//
//  Created by Julien Shim on 12/5/18.
//  Copyright © 2018 Julien Shim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allStories = StoryBank()
    var storyIndex = 0;

    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadText()
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print(sender.tag)
        
        
    }
    
    func loadText () {
        
        storyTextView.text = allStories.list[storyIndex].storyText
        
        // Annoying Attributed Styling
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle
            
        ]
        
        topButton.setAttributedTitle(NSAttributedString(string: allStories.list[storyIndex].choiceA, attributes: attributes), for: .normal)
        bottomButton.setAttributedTitle(NSAttributedString(string: allStories.list[storyIndex].choiceB, attributes: attributes), for: .normal)
        
    }
    
    
}

