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
    
    func tokenRequest(method: RequestMethod = .GET, URLString: String, parameters: [String: AnyObject], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        
        guard let token = access_token else {
            
            //FIXME: 发送通知
            print("没有token,请登录")
            completion(nil, false)
            return
        }
        
        var parameter = parameters
        if parameter == nil {
            parameter = [String: AnyObject]()
        }
        
        parameter["access_token"] = token as AnyObject
        
        request(method: .GET, URLString: URLString, parameters: parameter, completion: completion)
        
    }
    
    
    func request(method: RequestMethod = .GET, URLString: String, parameters: [String: Any], completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()){
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            print("网络错误")
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                
                print("token已经过期了")
                
                //FIXME: 发送通知
            }
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
