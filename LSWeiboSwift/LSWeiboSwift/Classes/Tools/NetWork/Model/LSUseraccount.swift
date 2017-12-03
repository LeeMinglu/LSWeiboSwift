//
//  LSAccessCount.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/10/21.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import YYModel

class LSUserAccount: NSObject {
    
    var access_token: String?// = "2.00r27RPGzrWmFE98234ab1dcUgbmJC"
    var uid: String? //= "5722594907"
    
    
    /// 过期日期开发者是5年，测试者是3天
    var expires_in: TimeInterval = 0 {
        didSet {
            
            expiresDate = Date(timeIntervalSinceNow: expires_in)
            
        }
    }
    //过期日期
    var expiresDate: Date?
    
    override var description: String {
        return yy_modelDescription()
    }

}
