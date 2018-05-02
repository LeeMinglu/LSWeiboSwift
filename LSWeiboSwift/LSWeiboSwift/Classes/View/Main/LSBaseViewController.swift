//
//  LSBaseViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSBaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableview :UITableView?
    var isPullUp: Bool = false
    
    var logon : Bool = false
    
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))

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
        
        if #available(iOS 11.0, *) {
            setupUI()
        } else {
            // Fallback on earlier versions
        }
        setupTableView()
        loadData()
        

        // Do any additional setup after loading the view.
    }

}

 extension LSBaseViewController {

  @objc  func setupUI() {
        self.view.backgroundColor = UIColor.cz_color(withHex: 0xf6f6f6)
        
        setupNavBar()
        
        logon ? setupTableView() : setupVisitorView()
        
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    
    /// setup NavigationController
    private func setupNavBar() {
        self.view.addSubview(navBar)

        navBar.items = [navItem]
        navBar.tintColor = UIColor.cz_color(withHex: 0xf6f6f6)
        navBar.backgroundColor = UIColor.lightGray
        navBar.layer.frame = CGRect(origin: CGPoint(x: 0, y: 20), size: CGSize(width: UIScreen.cz_screenWidth(), height: 44))
    
    }
    
}

extension  LSBaseViewController {
    
    func setupTableView() {
        
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
    
    func setupVisitorView() {
        
        let visitorView = LSVisitorView(frame: self.view.bounds)
        self.view.insertSubview(visitorView, belowSubview: navBar)
        
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
