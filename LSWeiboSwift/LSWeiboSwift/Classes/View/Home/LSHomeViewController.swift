//
//  LSHomeViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSHomeViewController: LSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func loadData() {
        print("loaddata")
    }
    
    /// click friend Method
    @objc func clickFriend() {
        
        print("click friend")
        
        let demoVC = LSDemoViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
}

extension LSHomeViewController {
    
    override func setupUI() {
        super.setupUI()
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", fontSize: 15, normalColor: .black, highlightedColor: .orange, target: self, action: #selector(clickFriend), contronEvents: .touchUpInside)
        
    }
    
}
