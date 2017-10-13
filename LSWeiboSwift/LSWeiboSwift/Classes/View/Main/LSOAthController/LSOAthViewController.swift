//
//  LSOAthViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/10/13.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSOAthViewController: UIViewController {
    
    lazy var webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = webView
        
        webView.backgroundColor = UIColor.white
        
        title = "用户认证界面"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(back))

        // Do any additional setup after loading the view.
    }
    
    @objc fileprivate func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
