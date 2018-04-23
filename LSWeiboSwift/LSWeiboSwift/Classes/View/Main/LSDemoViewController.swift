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
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    @objc func clickNext() {
        
        navigationController?.pushViewController(LSDemoViewController(), animated: true)
        
    }
}

extension LSDemoViewController {
    
    override func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .plain, target: self, action: #selector(clickNext))
    }
    
}
