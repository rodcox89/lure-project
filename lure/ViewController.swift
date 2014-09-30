//
//  ViewController.swift
//  lure
//
//  Created by Rodney cox on 9/23/14.
//  Copyright (c) 2014 lure. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    func displayAlert(title:String, error:String) {
        
        var alert = UIAlertController(title: title, message: error , preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBAction func signUp(sender: AnyObject) {
        
        /*println("Username:"\(username)"password:"\(password));*/
        
        var error = "" // creates a variable for error
        
        if username.text == "" || password.text == "" {
            
            error = " Looks like you forgot something"
            
        }
        
        func isValidEmail(testStr:String) -> Bool {
            println("validate calendar: \(testStr)")
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            
            var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluateWithObject(testStr)
            return result
        }
        
        
        if error != "" {
            
            displayAlert("Error in Form", error: error)
            
      
            
 // monday night 25 minutes in working on errors with login screen
            
        }
        else{ // create user
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            user.email = username.text
            // other fields can be set just like with PFObject
            
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, signupError: NSError!) -> Void in
                if signupError == nil {
                    // Hooray! Let them use the app now.
                } else {
                    if let errorString = signupError.userInfo!["error"] as? NSString{
                        error = errorString
                        
                    }else {
                        error = "please try again later"
                    }
                    // Show the errorString somewhere and let the user try again.
                    //println("signup error")
                }
            }
            
            
            
        }
        
        
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   
       
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
        
   }
}


