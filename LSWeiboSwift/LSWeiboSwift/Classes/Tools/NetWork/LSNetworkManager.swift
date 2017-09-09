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
    
    var accessToken: String? = "2.00r27RPGk3T56D2cc9a26c312LjLeE"
    
    func tokenRequest(method: LSRequestMethod = .GET, URLString: String, parameters: [String: Any]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        guard let token = accessToken else {
            print("没有token,请登录")
            completion(nil, false)
            return
        }
        
        var parameters = parameters
        if parameters == nil {
            parameters = [String: Any]()
        }
        
        parameters!["access_token"] = token
        
        request(method: .GET, URLString: URLString, parameters: parameters!, completion: completion)
    
    }
    
    /// GET /POST 网络请求
    ///
    /// - 参数说明:
    ///   - method: 请求方法  GET  POST
    ///   - URLString: URL链接
    ///   - parameters: 参数字典
    ///   - completion: 完成回调（字典、数组， 是否成功）
    func request(method: LSRequestMethod = .GET, URLString: String, parameters: [String: Any], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        

        let success = { (task: URLSessionDataTask, json: Any?)->() in
           completion(json, true)
        }

        let failure = {(task: URLSessionDataTask, error: Any)->() in
            
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
