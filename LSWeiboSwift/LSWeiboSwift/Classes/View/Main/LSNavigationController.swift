//
//  LSNavigationController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        self.navigationBar.isHidden = true
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = (viewController as? LSBaseController) {
                
                var title = "返回"
                print(" navigations的控制器为:  + \(childViewControllers)")
                
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem.init(title: title, normalColor: .blue, highlightedColor: .orange, target: self, action:  #selector(backVC), controlEvents: .touchUpInside)
            }
            
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    @objc fileprivate func backVC() {
        popViewController(animated: true)
    }
}
