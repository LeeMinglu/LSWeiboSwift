//
//  LSNetworkManager.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/5.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import AFNetworking

enum LSRequestMethod {
    case GET
    case POST
}

class LSNetworkManager: AFHTTPSessionManager {
    
   
    static let shared = LSNetworkManager()

    func request(method: LSRequestMethod = .GET, URLString: String, parameters: [String: AnyObject], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
           completion(json, true)
        }
        get
        let failure = {(task: URLSessionDataTask, error: Error)->() in
            
            print("网络发生错误" + "\(error)")
            completion(error, false)
            
        }
        
        
        if method == .GET {
            get(URLString, parameters: parameters, success: success, failure: failure)
        } else {
        
        post(URLString, parameters: parameters, success: success, failure: failure)
        }
    }

}
