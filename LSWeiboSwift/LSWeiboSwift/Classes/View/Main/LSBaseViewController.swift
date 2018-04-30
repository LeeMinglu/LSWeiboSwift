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
    
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))

    lazy var navItem = UINavigationItem()
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
        
    }
    
    func loadData() {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        setupTableView()
        

        // Do any additional setup after loading the view.
    }

}

 extension LSBaseViewController {

    func setupUI() {
       self.view.backgroundColor = UIColor.cz_color(withHex: 0xf6f6f6)
        setupNavBar()
        
        
        
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
        
        tableview?.contentInset = UIEdgeInsetsMake(navBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 0, 0)
        
        tableview?.delegate = self
        tableview?.dataSource = self
        
        self.view.insertSubview(tableview!, belowSubview: navBar)
    }
}

extension LSBaseViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
