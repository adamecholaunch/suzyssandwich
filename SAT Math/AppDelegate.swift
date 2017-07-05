//
//  AppDelegate.swift
//  SAT Math
//
//  Created by Adam Buys on 6/17/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import BuddySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appID = "6d67cc2a-06e8-44c0-a32b-5b1c0dac3aa8"
    let appKey = "ccbYqD9hcHsTEH08ZgmU0pHcbELM2oBx"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Buddy.init(appID, appKey: appKey)
        
        let servicePath = "/messages/" + appID
        let dict : NSDictionary = ["objectId" :"nwoI7r6AUm"]
        
        print(servicePath)
        //et claz = AnyClass
        
       

        Buddy.get("/Problem/nwoI7r6AUm", parameters: dict as! [AnyHashable : Any], class: BPPageResults.self, callback: {(_ u: Any, _ error: Error?) -> Void in
            print("hi1")
            print(u)
            print("hi2")
        })
        
        

       
        
        
        /* Buddy GET:[NSString stringWithFormat:@"pictures/%@/file",picture.id] parameters:nil class:[BPFile class] callback:^(id obj, NSError *error) {
            
            if(error==nil)
            {
                BPFile *file = (BPFile*)obj;
                
                UIImage* image = [UIImage imageWithData:file.fileData];
                [imageView setImage:image];
                [[CommonAppDelegate userPictures] addImage:image withPictureID:picture.id];
            }
            
        }]; */
            
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

