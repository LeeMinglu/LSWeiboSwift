//
//  LSNetworkManager+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/9.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

extension LSNetworkManager {
    func statusList(completion: @escaping (_ list: [[String: Any]]?, _ isSucess: Bool)->()) {
        let URLString = "https://api.weibo.com/2/statuses/public_timeline.json"
        
        tokenRequest(URLString: URLString, parameters: nil) { (json, isSucess) in
            
            
            let result = (json as? [String: Any])?["statuses"] as? [[String: Any]]
            
            completion(result, isSucess)
        }
        
    }
}
