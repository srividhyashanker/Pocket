//
//  MakeAccountViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/24/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit
import Firebase


class MakeAccountViewController: UIViewController {
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var enterUsername: UITextField!
  
    @IBAction func done(sender: AnyObject) {
        
        var newEmail = enterUsername.text
        var newPassword = enterPassword.text
        let ref = Firebase(url:"https://pocketbudget.firebaseio.com/")
        var myRootRef = Firebase(url:"https://pocketbudget.firebaseio.com/")
        ref.createUser(newEmail, password: newPassword,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    var alert = UIAlertController(title: "Uh Oh", message: "That didn't work.  IDK why...", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    // There was an error creating the account
                } else {
                    let uid = result["uid"] as? String
                    //myRootRef.setValue(newEmail)
                    self.performSegueWithIdentifier("backToLogin", sender: nil)

                }
        })
        var alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
        var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
        
        var usersRef = myRootRef.childByAppendingPath("users")
        
        var users = ["alanisawesome": alanisawesome, "gracehop": gracehop]
        usersRef.setValue(users)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
