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
    
    let access_token: String? = "2.00r27RPGzrWmFEb3dca20e3304egfU"
  
    static let shared: LSNetworkManager = {
        let instance = LSNetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")
        return instance
    }()
    
    func tokenRequest(method: RequestMethod = .GET, URLString: String, parameters: [String: Any], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        guard let token = access_token else {
            
            print("没有token,请登录")
            completion(nil, false)
            return
        }
        
        var parameter = parameters
        if parameter == nil {
            parameter = [String: Any]()
        }
        
        parameter["access_token"] = token
        
        request(method: .GET, URLString: URLString, parameters: parameter, completion: completion)
        
    }
    
    
    func request(method: RequestMethod = .GET, URLString: String, parameters: [String: Any], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()){
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            print("网络错误")
            print(error)
            completion( error, false)
            
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, success: success, failure: failure)
        } else {
            
            post(URLString, parameters: parameters, success: success , failure: failure)
        }
    }

}
