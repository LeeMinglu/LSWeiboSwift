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

   fileprivate lazy var weiboData = [String]()
    override func loaddata() {
        print("开始刷新")
        let URLString = "https://api.weibo.com/2/statuses/public_timeline.json"
        let parameters = ["access_token": "2.00r27RPGk3T56D2cc9a26c312LjLeE"]
//        LSNetworkManager.shared.get(URLString,
//            parameters: parameters,success: {
//                (_, json) in
//            print(json)
//        }) {
//            (_, error) in
//            print(error)
//        }
        LSNetworkManager.shared.request(method: .GET, URLString: URLString, parameters: parameters as [String : AnyObject]) { (json, isSucess) in
            print(json!)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            for i in 0..<5 {
                
                if self.isUpPull {
                    self.weiboData.append("上拉" + i.description)
                }else {
                    self.weiboData.insert(i.description, at: 0)
                }
            }
            self.refreshControl?.endRefreshing()
            print("结束刷新")
            self.isUpPull = false
            self.tableview?.reloadData()
        }
        

      
    }
  
    @objc fileprivate func friendVC () {
        let vc = LSDemoController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
    
    

}

extension LSHomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weiboData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview?.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell?.textLabel?.text = weiboData[indexPath.row]
        
        return cell!
    }
    

}

extension LSHomeController {
    
    override func setupTableview() {
        super.setupTableview()
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友",  normalColor: .blue, highlightedColor: .orange, target: self, action: #selector(friendVC), controlEvents: .touchUpInside)
        //        }
        // 注册原型 cell
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

    }
    
}

