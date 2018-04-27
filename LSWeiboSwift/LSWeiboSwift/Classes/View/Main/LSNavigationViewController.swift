//
//  LSNavigationViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/21.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isHidden = true
//navigationBar.bounds (0.0, 0.0, 375.0, 44.0)
       // print(self.navigationBar.bounds)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            if let vc = (viewController as? LSBaseViewController) {
                
                var title =   "返回"
                print(" navigations的控制器为:  + \(childViewControllers)")
                
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem.init(title: title, normalColor: .black, highlightedColor: .orange, target: nil, action: #selector(backVC), contronEvents: .touchUpInside)
                
            }
           
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func backVC() {
        
        popViewController(animated: true)
    }

}
