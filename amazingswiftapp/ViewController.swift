//
//  ViewController.swift
//  amazingswiftapp
//
//  Created by Sid Bala on 6/21/16.
//  Copyright © 2016 Sid Bala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func setAsync(sender: AnyObject) {
        let delayInSeconds = 1.0
        let popTime = dispatch_time(DISPATCH_TIME_NOW,
                                    Int64(delayInSeconds * Double(NSEC_PER_SEC))) // 1
        dispatch_after(popTime, dispatch_get_main_queue()) { // 2
            
            BuddyBuildSDK.setCrashMetadataObject("AsyncValue", forKey: "AsyncKey");
        }
    }
    @IBAction func setNew(sender: AnyObject) {
        BuddyBuildSDK.setCrashMetadataObject("576af2a10077a7dd", forKey: "UserID");
        BuddyBuildSDK.setCrashMetadataObject("Login Page", forKey: "CurrentState");
        
        BuddyBuildSDK.setCrashMetadataObject("v1k3", forKey: "k3");

    }
    
    
    @IBAction func setExisting(sender: AnyObject) {
        [BuddyBuildSDK .setCrashMetadataObject("Meow", forKey: "CurrentState")];
    }
    
    @IBAction func unsetExisting(sender: AnyObject) {
        [BuddyBuildSDK .setCrashMetadataObject(nil, forKey: "k3")];
    }
    
    @IBAction func blowUp(sender: AnyObject) {
        NSLog("Blowing Up");
        fatalError()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

