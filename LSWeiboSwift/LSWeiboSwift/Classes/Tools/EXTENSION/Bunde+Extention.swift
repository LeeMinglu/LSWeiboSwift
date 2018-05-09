//
//  Bunde+Extention.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/21.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import Foundation

extension Bundle {
    
    var nameSpace: String {
        
        return infoDictionary?["CFBundleExecutable"] as? String ?? ""
        
    }
    
}
