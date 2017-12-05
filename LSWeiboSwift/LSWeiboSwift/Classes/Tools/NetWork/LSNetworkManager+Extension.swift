//
//  LSNetworkManager+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/9.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

extension LSNetworkManager {
    func statusList(since_id: Int64 = 0, max_id: Int64 = 0,completion: @escaping (_ list: [[String: Any]]?, _ isSucess: Bool)->()) {
        let URLString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        let parameters = ["since_id": since_id,
                          "max_id": max_id > 0 ? (max_id - 1) : 0]
        tokenRequest(URLString: URLString, parameters: parameters) { (json, isSucess) in
            
            
            let result = (json as? [String: Any])?["statuses"] as? [[String: Any]]
            
            completion(result, isSucess)
        }
        
    }
    
    
    /// 未读消息
    ///
    /// - Parameter completion: 回调未读数量
    func unReadCount(completion:@escaping (_ count: Int64) -> ()) {
        guard let uid = userAccount.uid else {
            return
        }
        let URLString = "https://rm.api.weibo.com/2/remind/unread_count.json"
        let parameters = ["uid": uid]
        
        tokenRequest(URLString: URLString, parameters: parameters) { (json, isSuccess) in
            let dict = json as? [String: Any]
            let count = dict?["status"] as? Int64
            
            completion(count ?? 0)
            
        }
    }
    
}

// MARK: - OAuth 相关方法
extension LSNetworkManager {
    func loadAccessToken(code: String, completion: @escaping (_ isSuccess: Bool)->()) {
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        let parameters = [
            "client_id":AppKey,
            "client_secret":AppSecret,
            "grant_type":"authorization_code",
            "code":code,
            "redirect_uri":RedirectURL]
        
        request(method: .POST, URLString: urlString, parameters: parameters) { (json, isSucess) in
            
            print(json ?? "")
            //因为这里没有remind_in,使用KVC会导致崩溃
            self.userAccount.yy_modelSet(withJSON: (json as? [String: Any]) ?? [:])
            
            print(self.userAccount)
            
            //保存账户模型
            self.userAccount.saveAccount()
            
            //完成回调
            completion(isSucess)
            
            
        }
        
    }
}
