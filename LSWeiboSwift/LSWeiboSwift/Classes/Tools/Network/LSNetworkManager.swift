//
//  LSNetworkManager.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/5/9.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//
import UIKit
import AFNetworking

class LSNetworkManager: AFHTTPSessionManager {
  
    static let shared: LSNetworkManager = {
        let instance = LSNetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")
        return instance
    }()
    

}
