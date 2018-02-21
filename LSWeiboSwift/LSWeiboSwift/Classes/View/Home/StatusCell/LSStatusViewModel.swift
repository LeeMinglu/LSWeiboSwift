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
    
    var memberIcon: UIImage?
    
    init(model: LSStatus) {
        
        self.status = model
        
        if (model.user?.mbrank)! > 0 || (model.user?.mbrank)! < 7 {
        
        }
        let imageName = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
        memberIcon = UIImage(named: imageName)
        
        print("等级名称+\(imageName)")
    }
    
    var description: String {
        return  status.description
    }
    
}
