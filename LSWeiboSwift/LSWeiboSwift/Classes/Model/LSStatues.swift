//
//  LSStatues.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/5/15.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit
import YYModel


class LSStatues: NSObject {
    var id: Int64 = 0
    var text: String?
    
    override var description: String {
        
        return yy_modelDescription()
    }
}
