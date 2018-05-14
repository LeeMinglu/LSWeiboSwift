//
//  LSNetworkManager.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/5/9.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//
import UIKit
import AFNetworking

enum RequestMethod {
    
    case GET
    case POST
}

class LSNetworkManager: AFHTTPSessionManager {
  
    static let shared: LSNetworkManager = {
        let instance = LSNetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")
        return instance
    }()
    
    
    func request(method: RequestMethod = .GET, URLString: String, parameters: [String: Any], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()){
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Any)->() in
            print("网络错误")
            completion( error, false)
            
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, success: success, failure: failure)
        } else {
            
            post(URLString, parameters: parameters, success: success as! (URLSessionDataTask, Any?) -> Void, failure: failure)
        }
    }

}
