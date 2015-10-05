//
//  ViewController.swift
//  Week4Lecture
//
//  Created by Lyssa on 10/2/15.
//  Copyright © 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerXConstraint: NSLayoutConstraint!
    @IBOutlet weak var centerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tap = UITapGestureRecognizer(target: self, action: "didTapView:")
//        centerView.addGestureRecognizer(tap)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "didPan:")
        self.centerView.addGestureRecognizer(panGesture)
        
    }
    
    func didTapView(sender: UITapGestureRecognizer) {
        print("Did tap view")
    
    }
    
    func didPan(gesture: UIPanGestureRecognizer) {
        // NSLog("State:\(gesture.state.rawValue)")
        
        switch gesture.state {
        case .Began:
            print("Began")
        case .Changed:
            let translation = gesture.translationInView(self.view)
            NSLog("Changed: \(translation)")
            self.centerXConstraint.constant = translation.x
            self.centerYConstraint.constant = translation.y
        case .Ended:
            print("Ended")
            self.centerXConstraint.constant = 0
            self.centerYConstraint.constant = 0
        default:
            print("Unhandled state")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

