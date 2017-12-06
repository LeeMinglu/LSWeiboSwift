//
//  LSBaseController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSBaseController: UIViewController {

    let navBar = UINavigationBar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navItem = UINavigationItem()
    
    var tableview: UITableView?
    
    var refreshControl: UIRefreshControl?
    
//    //登陆状态
//    let Logon: Bool = true
       

    var isUpPull: Bool = false
    
    var visitorDictionary: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loaddata()
        
        //监听通知
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: NSNotification.Name(rawValue: LSUSERLoginSuccessNotification), object: nil)
        
    }
    
    deinit {
        //注销通知
        NotificationCenter.default.removeObserver(self)
    }
    
    override var title: String? {
        didSet {
           navItem.title = title
        }
    }
    
    func loaddata() {
        
        //如果子类不实现任何功能，默认关闭刷新控件
        self.refreshControl?.endRefreshing()
    }

}

//访客视频监听方法
extension LSBaseController {
    
    //登录成功处理
    @objc func loginSuccess(n: Notification){
        
        print("登录成功")
        //取消显示登录与注册字样
        navItem.leftBarButtonItem = nil
        navItem.rightBarButtonItem = nil
        
        //修改指示器的Inset
        tableview?.scrollIndicatorInsets = tableview!.contentInset
        
        //更新UI，当view=nil时，会调用loadView->viewDidLoad方法
        view = nil
        
        //注销通知，执行ViewDidLoad方法后再次注册，避免通知被重复注册
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @objc func loginEvent() {
        print("点击了登陆按钮")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: LSUserShouldeLoginNotification), object: nil)
    }
    
    @objc func registerEvent() {
        print("点击了注册按钮")
    }
}



extension LSBaseController {
   fileprivate func setupUI() {
     //   self.view.backgroundColor = UIColor.cz_random()
        setupNavigationBar()
        LSNetworkManager.shared.userLogon ? setupTableview() : setupVistorView()
        automaticallyAdjustsScrollViewInsets = false
   
    }
    
    fileprivate func setupVistorView() {
        let VisitorView = LSVisitorView(frame: self.view.bounds)
        
        self.view.insertSubview(VisitorView, belowSubview: navBar)
        
        VisitorView.visitorInfo = visitorDictionary
        
        VisitorView.loginBtn.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        VisitorView.regigterBtn.addTarget(self, action: #selector(registerEvent), for: .touchUpInside)
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginEvent))
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerEvent))
        
    }
    
     func setupTableview() {
        tableview = UITableView(frame: view.bounds, style: .plain)
//        self.view.addSubview(tableview!)
        self.view.insertSubview(tableview!, belowSubview: navBar)
        tableview?.delegate = self
        tableview?.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loaddata), for: .valueChanged)
        tableview?.addSubview(refreshControl!)
        
        tableview?.contentInset = UIEdgeInsets(top: navBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        
        
        
    }
    
    private func setupNavigationBar() {
        self.view.addSubview(navBar)
        navBar.items = [navItem]
        
        //设置 navBar 的渲染颜色
        navBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        
        //设置标题颜色
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        
        //设置系统按钮的文字渲染颜色  只对系统.plain 的方法有效
        navBar.tintColor = UIColor.orange
        
    }
}



// MARK: - 代理协议
extension LSBaseController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
     //MARK: 上拉刷新判断条件
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //取出当前行
        let row = indexPath.row
        //取出最后一组
        let section = (tableview?.numberOfSections)! - 1
        
        if row < 0 || section < 0 {
            return
        }
        //获取最后一组总的行数
        let count = tableview!.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isUpPull {
            print("上拉刷新")
            isUpPull = true
            loaddata()
        }
        
        
    }
    
}
