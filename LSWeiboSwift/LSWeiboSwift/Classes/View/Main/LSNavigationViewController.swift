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
            
        }
        super.pushViewController(viewController, animated: false)
    }

}
