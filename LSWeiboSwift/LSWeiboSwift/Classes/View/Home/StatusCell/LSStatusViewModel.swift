//
//  LSStatusViewModel.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

//单条微博视图模型
import Foundation

class LSStatusViewModel: CustomStringConvertible {
    
    var status: LSStatus
    
    init(model: LSStatus) {
        
        self.status = model
    }
    
    var description: String {
        return  status.description
    }
    
}
