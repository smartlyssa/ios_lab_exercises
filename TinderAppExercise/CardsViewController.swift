//
//  CardsViewController.swift
//  TinderAppExercise
//
//  Created by Lyssa Laudencia on 10/8/15.
//  Copyright © 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        cardInitialCenter = photoImageView.center
    }

    @IBAction func didPan(sender: UIPanGestureRecognizer) {

        switch sender.state {
        case .Began:
            print("Began")
        case .Changed:
            
            let translation = sender.locationInView(self.view)
            photoImageView.center =  translation
            
            NSLog("Changed: \(translation)")
        case .Ended:
            print("Ended")
            photoImageView.center = cardInitialCenter
        default:
            print("Unhandled state")
        }
        
    }
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        
        performSegueWithIdentifier( "profileSegue", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("card disappeared")
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
