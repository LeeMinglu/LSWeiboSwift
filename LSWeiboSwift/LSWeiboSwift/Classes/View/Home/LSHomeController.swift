//
//  LSHomeController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSHomeController: LSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @objc fileprivate func friendVC () {
        let vc = LSDemoController()
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension LSHomeController {
    override func setupUI() {
        super.setupUI()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(friendVC))
    }
}
