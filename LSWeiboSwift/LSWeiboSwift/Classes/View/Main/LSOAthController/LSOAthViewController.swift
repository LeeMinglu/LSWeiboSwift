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
    
    override func loadView() {
        view = webView
        
        webView.backgroundColor = UIColor.white
        
        title = "用户认证界面"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(back))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.请求URI String
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(AppKey)&redirect_uri=\(RedictURI)"
        
        //2.URL
        guard let url = URL(string: urlString) else {
            return
        }
        
        //3.设置请求
        let request = URLRequest(url: url)
        
        //4.请求数据
        webView.loadRequest(request)
    }
    
    @objc fileprivate func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
