//
//  LSMainViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
//        view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension LSMainViewController {
    
    func setupViewControllers() {
        let array = [
            ["clsName": "LSHomeViewController", "title" : "首页", "imageName": "home"],
            ["clsName": "LSDiscoverViewController", "title" : "发现", "imageName": "discover"],
//            [],
           ["clsName": "LSMessageViewController", "title" : "消息", "imageName": "message_center"],
            ["clsName": "LSProfileViewController", "title" : "我", "imageName": "profile"],
           
            
        ]
        
        var VCArray = [UIViewController]()
        
        for dict in array {
            
            let vc = dictToController(dict: dict)
            VCArray.append(vc)
        }
        
        viewControllers = VCArray
        
        
    }
   
    private func dictToController(dict: [String: String]) -> UIViewController {
        
        guard let clsName = dict["clsName"],
        let title = dict["title"],
        let imageName = dict["imageName"],
//        let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
        else {
        
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.setTitleTextAttributes([NSAttachmentAttributeName: UIFont.systemFont(ofSize: 15)], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .highlighted)
//        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 15)], for: UIControlState(rawValue: 0))


        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")
        let nav = LSNavigationViewController(rootViewController: vc)
        return nav
    }
    
}
