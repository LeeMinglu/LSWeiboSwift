//
//  LSNavigationViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/21.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSNavigationViewController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: false)
    }

}
