//
//  LSStatus.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/9.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import YYModel

class LSStatus: NSObject {
    
    var id: Int64 = 0
    var text: String?
    
    //转发数
    var reposts_count: Int = 0
    //评论数
    var comments_count: Int = 0
    //点赞数
    var attitudes_count: Int = 0
    //用户参数
    var user: LSUser?
    //转发微博属性
    var retweeted_status: LSStatus?
    //配图数组
    var pic_urls: [LSPicture]?
    
    override var description: String {
        return yy_modelDescription()
    }
    
    class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        return ["pic_urls": LSPicture.self]
    }

}

