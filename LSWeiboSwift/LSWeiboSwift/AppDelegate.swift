//
//  AppDelegate.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import UserNotifications
import SVProgressHUD
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupAdditions()
        
        window = UIWindow()
        
        let RootVc = LSMainController()
        window?.rootViewController = RootVc
        
        window?.makeKeyAndVisible()
        
        loadApp()
        
        return true
    }

}

//设置应用程序额外信息
extension AppDelegate {
    
    func setupAdditions() {
    
        SVProgressHUD.setAnimationDuration(5)
        
        //设置网络加载指示器
        AFNetworkActivityIndicatorManager.shared().isEnabled = true
        
        //设置用户授权显示通知
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .carPlay]) { (isSucess, error) in
                print("授权 \(isSucess ? "成功": "失败")")
            }
        } else {
            let notifySettings = UIUserNotificationSettings(types: [.alert,.badge,.sound], categories: nil)
            
            UIApplication.shared.registerUserNotificationSettings(notifySettings)
        }
        
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

