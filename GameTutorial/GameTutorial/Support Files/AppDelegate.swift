//
//  AppDelegate.swift
//  GameTutorial
//
//  Created by admin1 on 15.02.23.
//

import UIKit
import AppsFlyerLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var orientation: UIInterfaceOrientationMask = .landscape
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientation
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppsFlyerLib.shared().delegate = self
        
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


extension AppDelegate: AppsFlyerLibDelegate {
    func onConversionDataFail(_ error: Error) {
        <#code#>
    }
    
     // Метод вызывается при переходе по ссылке, если приложение не было ранее установлено и пользователь попал в него после установки из AppStore
    func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
    // Проверяем, что ссылка была впервые открыта, используется, чтобы не было ложных срабатываний при последующих запусках приложения
        guard let is_first_launch = conversionInfo["is_first_launch"] as? Bool, is_first_launch else { return }
    // Извлекаем из словаря conversionInfo указанные при создании ссылки параметры и передаем их в обработчик
    }
   // Метод вызывается при переходе по ссылке если приложение установлено
    func onAppOpenAttribution(_ attributionData: [AnyHashable: Any]) {
   // Извлекаем из словаря attributionData указанные при создании ссылки параметры и передаем их в обработчик
    }
}
