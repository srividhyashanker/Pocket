//
//  LoginViewController.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/24/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var tester: UILabel!
    
    @IBAction func loginButton(sender: AnyObject) {
        var username = userText.text
        var pass = passText.text
        let ref = Firebase(url: "https://pocketbudget.firebaseio.com")
        var myRootRef = Firebase(url:"https://docs-examples.firebaseio.com/web/data")
        myRootRef.childByAppendingPath("users/")
        
        var alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
        var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
        
        var usersRef = myRootRef.childByAppendingPath("users")
        
        var users = ["alanisawesome": alanisawesome, "gracehop": gracehop]

        println("yay")
        ref.authUser(username, password: pass,
            withCompletionBlock: { error, authData in
                if error != nil {
                    var alert = UIAlertController(title: "Uh Oh", message: "Your username or password is incorrect", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                   print(username)
                    print("yay")
                    // There was an error logging in to ths account
                } else {
                    print("yay")
                    /*set secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
                    
                    self.navigationController!.pushViewController(secondViewController, animated: true)*/
                    // We are now logged in
                    self.tester.text = "hi"
                    self.performSegueWithIdentifier("segue", sender: nil)
                }
        })
        
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
