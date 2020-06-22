//
//  AppDelegate.swift
//  19.12.12禁欲モンキー
//
//  Created by 福田一朗 on 2019/12/12.
//  Copyright © 2019 福田一朗. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let userDefault = UserDefaults.standard
        if userDefault.object(forKey: "onakinSwitch") != nil {
         
              }else{
                  userDefault.set(false,forKey: "onakinSwitch")
              }
  
        /*
        //もしタイマー関数が作動中なら
               if UserDefaults.standard.object(forKey: "start") != nil {
                   self.window = UIWindow(frame: UIScreen.main.bounds)
                   
                   //Storyboardを指定Main
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   
                   
                   //Viewcontrollerを指定//storyboardIDかな
                   let initialViewController = storyboard.instantiateViewController(withIdentifier: "timer")as UIViewController
                   //rootViewControllerに入れる
                   self.window?.rootViewController = initialViewController
                   self.window?.makeKeyAndVisible()
               } else{
                   self.window = UIWindow(frame: UIScreen.main.bounds)
                   
                   //Storyboardを指定MAINでいいはず
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   
                   
                   //Viewcontrollerを指定
                   let initialViewController = storyboard.instantiateViewController(withIdentifier: "front")as UIViewController
                   //rootViewControllerに入れる
                   self.window?.rootViewController = initialViewController
                   self.window?.makeKeyAndVisible()
               }
 */
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

