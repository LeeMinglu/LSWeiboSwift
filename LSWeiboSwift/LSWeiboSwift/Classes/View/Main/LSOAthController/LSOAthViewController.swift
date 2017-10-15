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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", target: self, action: #selector(autoStuff))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        1.请求URI String
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(AppKey)&redirect_uri=\(RedictURI)"
        
        //测试链接
//        let urlString = "https://passport.weibo.cn/signin/login?entry=mweibo&res=wel&wm=3349&r=http%3A%2F%2Fm.weibo.cn%2F%3F%26jumpfrom%3Dweibocom"
        
        
        //2.URL
        guard let url = URL(string: urlString) else {
            return
        }
        
        //3.设置请求
        let request = URLRequest(url: url)
        
        //4.请求数据
        webView.loadRequest(request)
        
    }
    
    //私有方法
    
    @objc fileprivate func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func autoStuff() {
        
        let AutoStuffContent = "document.getElementById('userId').value='13522154166';" +
         "document.getElementById('passwd').value='luoriver';"
        
        //测试javascript注入
//        let AutoStuffContent = "document.getElementById('loginName').value='13522154166';" +
//                            "document.getElementById('loginPassword').value='luoriver';"
        
        webView.stringByEvaluatingJavaScript(from: AutoStuffContent)
    
    }

}
