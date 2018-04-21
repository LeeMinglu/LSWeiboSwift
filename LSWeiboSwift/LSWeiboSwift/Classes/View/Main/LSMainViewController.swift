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
            ["clsName": "LSHomeViewController", "title" : "首页", "imageName": "tabbar_home"]
            
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
        
                return UIViewController.init()
        }
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        let nav = LSNavigationViewController(rootViewController: vc)
//        addChildViewController(nav)
        return nav
    }
    
}
