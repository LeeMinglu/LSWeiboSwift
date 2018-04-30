//
//  LSDemoViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/22.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSDemoViewController: LSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cz_random()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    @objc func clickNext() {
        
        navigationController?.pushViewController(LSDemoViewController(), animated: true)
        
    }
}

 extension LSDemoViewController {
    
   override func setupUI() {
         super.setupUI()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", normalColor: .black, highlightedColor: .orange, target: nil, action: #selector(clickNext), contronEvents: .touchUpInside)
        
    }
    
    
    
}
