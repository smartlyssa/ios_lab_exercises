//
//  ProfileViewController.swift
//  TinderAppExercise
//
//  Created by Lyssa Laudencia on 10/8/15.
//  Copyright © 2015 thegeekgoddess.net. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTap(sender: UITapGestureRecognizer) {
        
        performSegueWithIdentifier( "backHome", sender: self)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("profile disappeared")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }


}
