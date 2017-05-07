//
//  Bundle+Extension.swift
//  reFlect
//
//  Created by 李明禄 on 2017/5/6.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import Foundation

extension Bundle {
    var namespace: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
