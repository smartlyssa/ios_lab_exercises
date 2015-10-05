//
//  ViewController.swift
//  Week4Lecture3
//
//  Created by Lyssa on 10/4/15.
//  Copyright © 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleView.layer.cornerRadius = 50.0
        circleView.layer.borderColor = UIColor.blackColor().CGColor
        circleView.layer.borderWidth = 2.0
        
        let tap = UITapGestureRecognizer(target: self, action: "didTap:")
        circleView.addGestureRecognizer(tap)
        
    }
    
    @IBAction func didTapStop(sender: AnyObject) {
        self.circleView.layer.removeAllAnimations()
    }
    
    func didTap(sender: UITapGestureRecognizer) {

        let animation = CAKeyframeAnimation(keyPath: "position")
        var position = circleView.layer.position
        
        let endAngle1 = CGFloat(2 * M_PI) - CGFloat(M_PI / 2.0)
        let endAngle2 = CGFloat(2 * M_PI)
        
        position.y += 150
        let curve = UIBezierPath(arcCenter: position, radius: CGFloat(150), startAngle: CGFloat(0) - CGFloat(M_PI / 2.0), endAngle: endAngle1, clockwise: true).CGPath
        animation.path = curve
        animation.duration = 2.0
        circleView.layer.addAnimation(animation, forKey: "circular")
        
//        UIView.animateKeyframesWithDuration(2.0, delay: 0.0, options: [.Repeat], animations: {
//            
//            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5) {
//                self.verticalConstraint.constant = 200.0
//                self.view.layoutIfNeeded()
//            }
//        
//            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.5) {
//                self.verticalConstraint.constant = 0
//                self.view.layoutIfNeeded()
//            }
//            
//            }) { (finished) -> Void in
//        }
        
        
//        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
//                self.verticalConstraint.constant = 200.0
//                self.view.layoutIfNeeded()
//            }) { (finished) -> Void in
//        }
    
//        UIView.animateWithDuration(0.35) {
//            self.verticalConstraint.constant = 200.0
//            self.view.layoutIfNeeded()
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

