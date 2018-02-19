//
//  LSUser.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSUser: NSObject {
    
    //用户ID
    var id: Int64 = 0
    
    //用户昵称
    var screen_name: String?
    
    //用户头像地址 50*50像素
    var profile_image_url: String?
    
    //认证类型： -1 没有认证； 0：认证用户； 2，3，5：企业认证； 220： 达人
    var verified_type: Int = 0
    
    //会员等级0-6
    var mbrank: Int = 0
    
    

}
