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
    
    func loaddata() {}

}

extension LSBaseController {
    func setupUI() {
     //   self.view.backgroundColor = UIColor.cz_random()
        setupNavigationBar()
        setupTableview()
        
       
        
    }
    
    private func setupTableview() {
        tableview = UITableView(frame: view.bounds, style: .plain)
//        self.view.addSubview(tableview!)
        self.view.insertSubview(tableview!, belowSubview: navBar)
        tableview?.delegate = self
        tableview?.dataSource = self
        
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
    
}
