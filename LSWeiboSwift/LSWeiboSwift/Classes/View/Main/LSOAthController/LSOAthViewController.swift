//
//  LSOAthViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/10/13.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import SVProgressHUD

class LSOAthViewController: UIViewController {
    
    lazy var webView = UIWebView()
    
    override func loadView() {
        view = webView
        
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = UIColor.white
        
        title = "用户认证界面"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", target: self, action: #selector(autoStuff))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webviewRequest()
        
        webView.delegate = self
        
    }
    
    func webviewRequest() {
//        1.请求URI String
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(AppKey)&redirect_uri=\(RedirectURL)"
        
        //2.URL
        guard let url = URL(string: urlString) else {
            return
        }
        
        //3.设置请求
        let request = URLRequest(url: url)
        
        //4.请求数据
        webView.loadRequest(request)
    }
    
    
    //私有方法-------------------------------------------------
    
    @objc fileprivate func close() {
        
        SVProgressHUD.dismiss()
        self.dismiss(animated: true, completion: nil)
    }
    

    /// 自动填充用户名与密码的方法
    @objc fileprivate func autoStuff() {
        
        let AutoStuffContent = "document.getElementById('userId').value='13522154166';" +
         "document.getElementById('passwd').value='luoriver';"
        
        webView.stringByEvaluatingJavaScript(from: AutoStuffContent)
    
    }

}

extension LSOAthViewController: UIWebViewDelegate {
    

    /// Description
    ///
    /// - Parameters:
    ///   - webView: webView
    ///   - request: 请求的链接
    ///   - navigationType: type
    /// - Returns:
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        //1.判断链接中是否有“https://www.baidu.com”
        if request.url?.absoluteString.hasPrefix(RedirectURL) == false {
            return true
        }
        
        //2.判断链接中是否有code=
        
        if request.url?.query?.hasPrefix("code=") == false {
            
            print("授权失败")
            close()
            return false
        }
        
        //3.获取授权码
        let code = request.url?.query?.substring(from: "code=".endIndex) ?? ""
        
        print("授权码为：\(code)")
        
        //获取token
        LSNetworkManager.shared.loadAccessToken(code: code) { (isSuccess) in
            
            if !isSuccess {
              SVProgressHUD.showInfo(withStatus: "网络请求失败")
            } else {
                SVProgressHUD.showInfo(withStatus: "用户登录成功")
                //发送通知
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: LSUSERLoginSuccessNotification), object: nil)
                
                self.close()
            }
        }
        
        return false
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
}
