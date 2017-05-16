//
//  LSDemoController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/10.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSDemoController: LSBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "第 +  \(navigationController?.childViewControllers.count ?? 0) 个"
        
        print("进入DeMo控制器")
        // Do any additional setup after loading the view.
        
        
    }
    
    @objc fileprivate func nextVC() {
        navigationController?.pushViewController(LSDemoController(), animated: true)
    }
}

extension LSDemoController {
    override func setupUI() {
        super.setupUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", style: .plain, target: self, action: #selector(nextVC))
    }
}
