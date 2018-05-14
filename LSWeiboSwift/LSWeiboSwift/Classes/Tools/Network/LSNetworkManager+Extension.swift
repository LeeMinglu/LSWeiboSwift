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
    func statusList(completion: @escaping (_ result: [String: Any]?, _ isSuccess:Bool)->()) {
        
        let parameters = ["access_token":"2.00r27RPGzrWmFEb3dca20e3304egfU"]
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        LSNetworkManager.shared.request(method: .GET, URLString: urlString, parameters: parameters as [String: AnyObject]) { (json, isSuccess) in
            
            completion(json as? [String : Any], isSuccess)
        }
    }
    
}
