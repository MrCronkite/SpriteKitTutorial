//
//  AppDelegate.swift
//  GameTutorial
//
//  Created by admin1 on 15.02.23.
//

import UIKit
import AppsFlyerLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate{
    var window: UIWindow?

    var orientation: UIInterfaceOrientationMask = .landscape
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        
        return orientation
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    


}


extension AppDelegate: DeepLinkDelegate{
    
}

extension AppDelegate: AppsFlyerLibDelegate {
     
    // Handle Organic/Non-organic installation
    func onConversionDataSuccess(_ data: [AnyHashable: Any]) {
        ConversionData = data
        print("onConversionDataSuccess data:")
        for (key, value) in data {
            print(key, ":", value)
        }
        if let conversionData = data as NSDictionary? as! [String:Any]? {
        
            if let status = conversionData["af_status"] as? String {
                if (status == "Non-organic") {
                    if let sourceID = conversionData["media_source"],
                        let campaign = conversionData["campaign"] {
                        NSLog("[AFSDK] This is a Non-Organic install. Media source: \(sourceID)  Campaign: \(campaign)")
                    }
                } else {
                    NSLog("[AFSDK] This is an organic install.")
                }
                
                if let is_first_launch = conversionData["is_first_launch"] as? Bool,
                    is_first_launch {
                    NSLog("[AFSDK] First Launch")
                    if !conversionData.keys.contains("deep_link_value") && conversionData.keys.contains("fruit_name"){
                        switch conversionData["fruit_name"] {
                            case let fruitNameStr as String:
                            NSLog("This is a deferred deep link opened using conversion data")
                            walkToSceneWithParams(fruitName: fruitNameStr, deepLinkData: conversionData)
                            default:
                                NSLog("Could not extract deep_link_value or fruit_name from deep link object using conversion data")
                                return
                        }
                    }
                } else {
                    NSLog("[AFSDK] Not First Launch")
                }
            }
        }
    }
    
    func onConversionDataFail(_ error: Error) {
        NSLog("[AFSDK] \(error)")
    }
}
