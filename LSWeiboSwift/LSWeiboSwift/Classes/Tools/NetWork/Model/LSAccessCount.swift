//
//  LSAccessCount.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/10/21.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import YYModel

class LSAccessCount: NSObject {
    
    var access_token: String?
    var uid: String?
    var expired_in: TimeInterval = 0
    
    override var description: String {
        return yy_modelDescription()
    }

}
