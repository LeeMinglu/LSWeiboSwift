//
//  LSPicture.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/22.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

/// 微博配图模型
class LSPicture: NSObject {
    
    /// 缩略图地址
    var thumbnail_pic: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}

