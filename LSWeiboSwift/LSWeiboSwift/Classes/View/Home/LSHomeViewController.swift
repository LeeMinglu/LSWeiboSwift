//
//  LSHomeViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSHomeViewController: LSBaseViewController {
    
    let CELLID: String = "DATA_ID"
    
    var weiBoData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func loadData() {
        
        LSNetworkManager.shared.statusList()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            for i in 1...20 {
                
                self.weiBoData.insert(i.description, at: 0)
     
            }
            
            self.downRefreshControl?.endRefreshing()
            self.tableview?.reloadData()
            
            
        }
        
        
    }
    
    /// click friend Method
    @objc func clickFriend() {
        
        print("click friend")
        
        let demoVC = LSDemoViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
}

extension LSHomeViewController {
    
   override func setupUI() {
        super.setupUI()
    
        if !logon {
        
            navItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", fontSize: 15, normalColor: .black,  highlightedColor: .orange, target: self, action: #selector(clickRegisterEvent), contronEvents: .touchUpInside)
        
        } else {
            
            navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", fontSize: 15, normalColor: .black, highlightedColor: .orange, target: self, action: #selector(clickFriend), contronEvents: .touchUpInside)
    }
        
    
        
        self.tableview?.register(UITableViewCell.self, forCellReuseIdentifier: CELLID)
        
    }
    
}

extension LSHomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weiBoData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = weiBoData[indexPath.row]
        
        return cell
        
    }
    
}
