//
//  LSNetworkManager+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/9.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

extension LSNetworkManager {
    func statusList(completion:@escaping (_ list: [[String: Any]]?, _ isSucess: Bool)->()) {
        let URLString = "https://api.weibo.com/2/statuses/public_timeline.json"
        let parameters = ["access_token": "2.00r27RPGk3T56D2cc9a26c312LjLeE"]
        
        tokenRequest(URLString: URLString, parameters: parameters as [String : AnyObject]) { (json, isSucess) in
            
            
            let result = (json as? [String: Any])?["statuses"] as? [[String: Any]]
            
            completion(result, isSucess)
        }
        
    }
}
