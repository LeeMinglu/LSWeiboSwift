//
//  LSHomeController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

fileprivate let OriginalCellID = "OriginalCellID"
fileprivate let RetweetedCellID = "RetweetedCellID"



class LSHomeController: LSBaseController {
    
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
        
        let viewModel = statusViewModel.statusList[indexPath.row]
        
        let CellID = (viewModel.status.retweeted_status != nil) ? RetweetedCellID : OriginalCellID 
        
        let cell = tableview?.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! LSStatusCell
        
       
        cell.viewModel = viewModel
        
        return cell
    }
    

}
 //设置界面
extension LSHomeController {
    
    override func setupTableview() {
        super.setupTableview()
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 15, target: self, action:  #selector(friendVC), isBack: true)
        //        }
        // 注册原型 cell
   //     tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        //注册原创微博ceLLID
        tableview?.register(UINib(nibName: "WeiBoStatusNormalCell", bundle: nil), forCellReuseIdentifier: OriginalCellID)
        
        //注册转发微博CELLID
        tableview?.register(UINib(nibName: "WeiBoStatusRetweetedCell", bundle: nil), forCellReuseIdentifier: RetweetedCellID)
        
        tableview?.separatorStyle = .none
        tableview?.estimatedRowHeight = 300
        
        setupNavTitle()

    }
    
    private func setupNavTitle() {
        
        let title = LSNetworkManager.shared.userAccount.screen_name
        
        let button = LSTitleButton.init(title: title)
        
        button.addTarget(self, action: #selector(iconClicked), for: .touchUpInside)

        
        navItem.titleView = button
    }
    
    @objc func iconClicked(btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
    
}

