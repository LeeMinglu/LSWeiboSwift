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
    override func setupUI() {
        super.setupUI()
        
        if !Logon {
            navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(loginEvent))
        } else {
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友",  normalColor: .blue, highlightedColor: .orange, target: self, action: #selector(friendVC), controlEvents: .touchUpInside)
        }
        // 注册原型 cell
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
//        let nextBtn = UIButton.cz_textButton("好友", fontSize: 14, normalColor: UIColor.blue, highlightedColor: UIColor.orange)
       
//        nextBtn?.addTarget(self, action: #selector(friendVC), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: nextBtn!)
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", style: .plain, target: self, action: #selector(friendVC))
    }
}

