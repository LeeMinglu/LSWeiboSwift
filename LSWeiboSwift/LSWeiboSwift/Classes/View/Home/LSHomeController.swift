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
//        setupUI()
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
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友",  normalColor: .blue, highlightedColor: .orange, target: self, action: #selector(friendVC), controlEvents: .touchUpInside)
//        let nextBtn = UIButton.cz_textButton("好友", fontSize: 14, normalColor: UIColor.blue, highlightedColor: UIColor.orange)
       
//        nextBtn?.addTarget(self, action: #selector(friendVC), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: nextBtn!)
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(friendVC))
    }
}

