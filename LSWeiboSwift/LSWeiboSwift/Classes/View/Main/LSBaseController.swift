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
    
    //登陆状态
    let Logon: Bool = false
    
    //
    var isUpPull: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loaddata()
//        self.view.backgroundColor = UIColor.cz_random()
        // Do any additional setup after loading the view.
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

extension LSBaseController {
    func setupUI() {
     //   self.view.backgroundColor = UIColor.cz_random()
        setupNavigationBar()
        Logon ? setupTableview() : setupVistorView()
        automaticallyAdjustsScrollViewInsets = false
        
       
        
    }
    
    private func setupVistorView() {
        let VisitorView = LSVisitorView(frame: self.view.bounds)
        
        self.view.insertSubview(VisitorView, belowSubview: navBar)
        
    }
    
    private func setupTableview() {
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
