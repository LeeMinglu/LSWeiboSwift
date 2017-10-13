//
//  LSHomeController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit


class LSHomeController: LSBaseController {
    fileprivate let cellID = "cellID"
    
    var resultData: [[String: Any]]?
    
    //列表模型
    let statusViewModel = LSStatusListViewModel()

   fileprivate lazy var weiboData = [String]()
    override func loaddata() {
        print("开始刷新")
        statusViewModel.loadStatus(pullUp: isUpPull) { (isSucess, shouldPullup) in
        self.refreshControl?.endRefreshing()
        print("结束刷新")
        self.isUpPull = false
            
        if shouldPullup {
            self.tableview?.reloadData()
        }

        }
            
    }
  
    @objc fileprivate func friendVC () {
        let vc = LSDemoController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
    
    

}

extension LSHomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusViewModel.statusList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview?.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell?.textLabel?.text = statusViewModel.statusList[indexPath.row].text
        
        return cell!
    }
    

}

extension LSHomeController {
    
    override func setupTableview() {
        super.setupTableview()
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 15, target: self, action:  #selector(friendVC), isBack: true)
        //        }
        // 注册原型 cell
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

    }
    
}

