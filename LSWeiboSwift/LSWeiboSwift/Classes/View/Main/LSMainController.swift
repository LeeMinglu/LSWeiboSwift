//
//  LSMainController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
        
        setupControllers()
    }
}
 //extension切分代码块，可以将相似功能 的代码放在一下，便于代码维护
extension LSMainController {
    
    //设置子控制器
    func setupControllers() {
        let array = [
            ["clsName": "LSHomeController", "title" : "首页", "imageName": "home"],
            ["clsName": "LSDiscoverController", "title" : "发现", "imageName": "discover"],
            ["clsName": "LSMessageController", "title" : "消息", "imageName": "message_center"],
            ["clsName": "LSProfileController", "title" : "我", "imageName": "profile"]
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    //使用字典创建控制器
    private func controller(dict: [String: String]) -> UIViewController {
        
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
                
            return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)

       //设置字体大小及颜色
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 15)], for: UIControlState(rawValue: 0))
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: UIControlState.highlighted)
        
        let nav = LSNavigationController(rootViewController: vc)
        
        return nav
    
    }
    
}

