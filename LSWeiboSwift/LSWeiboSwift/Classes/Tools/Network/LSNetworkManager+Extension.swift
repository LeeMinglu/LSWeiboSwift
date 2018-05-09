//
//  LSNetworkManager+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/5/10.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import Foundation

extension LSNetworkManager {
    
    
    /// 获取statusList方法
    func statusList() {
        
        let parameters = ["access_token":"2.00r27RPGzrWmFEb3dca20e3304egfU"]
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        LSNetworkManager.shared.get(urlString, parameters: parameters, success: { (_, json) in
            print(json!)
        }) { (_, error) in
            print("请求失败")
        }
    }
    
}
