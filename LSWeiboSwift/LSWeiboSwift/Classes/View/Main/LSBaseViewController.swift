//
//  LSBaseViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSBaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var visitorInfo: [String: String]?
    var tableview :UITableView?
    var isPullUp: Bool = false
    
    var logon : Bool = false
    
    let navBar = UINavigationBar(frame: CGRect.init(x: 0, y: 30, width: UIScreen.main.bounds.width, height: 44))
    

    lazy var navItem = UINavigationItem()
    
    var downRefreshControl: UIRefreshControl?
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
        
    }
    
    @objc func loadData() {
        self.downRefreshControl?.endRefreshing()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        
        
        // Do any additional setup after loading the view.
    }

}

 extension LSBaseViewController {

  @objc  func setupUI() {
//        self.view.backgroundColor = UIColor.cz_color(withHex: 0xf6f6f6)
    
        setupNavBar()
        
        logon ? setupTableView() : setupVisitorView()
        
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    
    /// setup NavigationController
    private func setupNavBar() {
        
        
        self.view.addSubview(navBar)
         setStatusBarColor()

        navBar.items = [navItem]
        navBar.tintColor = UIColor.cz_color(withHex: 0xf6f6f6)
        
       
    
    }
    
    func setStatusBarColor() {
        
        let v = UIView(frame: CGRect(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: UIScreen.main.bounds.width, height: UIApplication.shared.statusBarFrame.height))
        
        v.backgroundColor = UIColor.cz_color(withHex: 0xf6f6f6)
        
        navBar.addSubview(v)
        
        
    }
    
}

extension  LSBaseViewController {
    
    fileprivate func setupTableView() {
        
        tableview = UITableView(frame: self.view.bounds, style: .plain)
        
        tableview?.contentInset = UIEdgeInsetsMake(navBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        
        tableview?.delegate = self
        tableview?.dataSource = self
        
        downRefreshControl = UIRefreshControl()
        
        tableview?.addSubview(downRefreshControl!)
        
        downRefreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
       
        self.view.insertSubview(tableview!, belowSubview: navBar)
        
        
    }
}

extension LSBaseViewController {
    
    fileprivate func setupVisitorView() {
        
        let visitorView = LSVisitorView(frame: self.view.bounds)
        self.view.insertSubview(visitorView, belowSubview: navBar)
        visitorView.visitorInfo = visitorInfo
        
        visitorView.LogonBtn.addTarget(self, action: #selector(clickLogonEvent), for: .touchUpInside)
        
        visitorView.registerBtn.addTarget(self, action: #selector(clickRegisterEvent), for: .touchUpInside)
        
    }
    
}

extension LSBaseViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
        let section = (tableView.numberOfSections) -  1
        
        if row < 0 || section < 0 {
            
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) || isPullUp == false {
            
            print("上拉刷新")
        }
        
    }
    
    
}


extension LSBaseViewController {
    
    @objc func clickLogonEvent() {
       
        print("点击了登陆按钮")
        
    }
    
    @objc func clickRegisterEvent() {
         print("点击了注册按钮")
        
    }
    

}
