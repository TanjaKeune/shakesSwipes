//
//  ViewController.swift
//  SwipesAndShakes
//
//  Created by Tanja Keune on 8/24/17.
//  Copyright © 2017 SUGAPP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
        
        swipeRight.direction  = UISwipeGestureRecognizerDirection.right
        
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    func swipeAction(gesture: UISwipeGestureRecognizer) {
        
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            label.text = "Swipe Right"
        } else {
            label.text = "Swipe Left"
        }
    }

    func swiped(gesture:UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                self.label.text = "Swipe Right"
            case UISwipeGestureRecognizerDirection.left:
                self.label.text = "Swipe Left"
            default:
                break
            }
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
       
        if event?.subtype == UIEventSubtype.motionShake {
            
            label.text = "Shake Shake"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

