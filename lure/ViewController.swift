//
//  ViewController.swift
//  lure
//
//  Created by Rodney cox on 9/23/14.
//  Copyright (c) 2014 lure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Parse.setApplicationId("yNmdrVTRzScdzt3qqRAgoAiV57orynGC165bRK2B", clientKey:"RyvkJA5iKHs7RXY9KiWUY3ac3O4bKVLKFnRttmlT")
       
        var score = PFObject(className: "score")
        score.setObject("Rob", forKey: "name")
        score.setObject(95, forKey: "number")
        score.saveInBackgroundWithBlock {(success: Bool!, error: NSError!) -> Void in
        
            if success == true {
                println("scorecreated with ID: \(score.objectId) ")
                
            } else {
                println(error)
            }
        }
        
    }
    @IBAction func nextPage(sender: UIButton) { println("Button Pressed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

