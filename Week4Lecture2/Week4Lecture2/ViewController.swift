//
//  ViewController.swift
//  Week4Lecture2
//
//  Created by Lyssa on 10/3/15.
//  Copyright © 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewControllers:[UIViewController] = [
        FirstViewController(nibName: nil, bundle: nil),
        SecondViewController(nibName: nil, bundle: nil)
    ]
    
    @IBOutlet weak var contentView: UIView!
    var selectedViewController:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectViewController(viewControllers[0])
    }
    
    func selectViewController(viewController: UIViewController) {
        
        if let existingViewController = selectedViewController {
            existingViewController.willMoveToParentViewController(nil)
            existingViewController.view.removeFromSuperview()
            existingViewController.removeFromParentViewController()
        }
        
        self.addChildViewController(viewController)
        viewController.view.frame = self.contentView.bounds
        viewController.view.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        self.contentView.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
        selectedViewController = viewController
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapFirstViewController(sender: AnyObject) {
        self.selectViewController(viewControllers[0])
    }
    
    @IBAction func didTapSecondViewController(sender: AnyObject) {
        self.selectViewController(viewControllers[1])
    }
}

class FirstViewController: UIViewController {
    override func loadView() {
        
        self.definesPresentationContext = true
        
        
        let v = UIView(frame: CGRectZero)
        v.backgroundColor = UIColor.greenColor()
        
        let tap = UITapGestureRecognizer(target: self, action: "didTap:")
        v.addGestureRecognizer(tap)
        
        self.view = v
    }
    
    func didTap(sender: UITapGestureRecognizer) {
        let third = ThirdViewController(nibName: nil, bundle: nil)
        
//        third.modalPresentationStyle = .OverCurrentContext
        third.modalPresentationStyle = .CurrentContext
        third.modalTransitionStyle = .FlipHorizontal
        
        self.presentViewController(third, animated: true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("screen is green")
    }
}

class SecondViewController: UIViewController {
    override func loadView() {
        let v = UIView(frame: CGRectZero)
        v.backgroundColor = UIColor.redColor()
        self.view = v
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("screen is red")
    }
}

class ThirdViewController: UIViewController {
    override func loadView() {
        let v = UIView(frame: CGRectZero)
        v.backgroundColor = UIColor.blueColor()
        self.view = v
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("screen is blue")
    }
}

