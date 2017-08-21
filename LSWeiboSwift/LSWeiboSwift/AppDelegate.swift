//
//  AppDelegate.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        
        let RootVc = LSMainController()
        window?.rootViewController = RootVc
        
        window?.makeKeyAndVisible()
        
        loadApp()
        
        return true
    }

}

extension AppDelegate {
    
     func loadApp() {
        
        DispatchQueue.global().async {
            
            let url = Bundle.main.url(forResource: "main2.json", withExtension: nil)
            
            let data = NSData(contentsOf: url!)
            
            //写入磁盘
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("main2.json")
            
            data?.write(toFile: jsonPath, atomically: true)
            
//            print(docDir)

        }
    }
}

