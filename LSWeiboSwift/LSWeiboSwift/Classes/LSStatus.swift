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
    
    override var description: String {
        return ("id: \(id), text: \(String(describing: text))")
    }

}