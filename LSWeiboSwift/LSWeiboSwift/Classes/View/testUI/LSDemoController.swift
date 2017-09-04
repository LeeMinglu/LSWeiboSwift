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
        setupTableview()
        title = "第  \(navigationController?.childViewControllers.count ?? 0) 个"
        
        print("进入DeMo控制器")
        // Do any additional setup after loading the view.
        
        
    }
    
    @objc fileprivate func nextVC() {
        navigationController?.pushViewController(LSDemoController(), animated: true)
    }
    
    
}

extension LSDemoController {
    
    override func setupTableview() {
        super.setupTableview()
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", normalColor: .blue, highlightedColor: .orange, target: self, action:  #selector(nextVC), controlEvents: .touchUpInside)
        

    }
    
}
