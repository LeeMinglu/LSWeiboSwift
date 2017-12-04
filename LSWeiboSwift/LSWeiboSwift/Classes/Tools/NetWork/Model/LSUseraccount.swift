//
//  LSAccessCount.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/10/21.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import YYModel

private let expires_in_String: String = "expires_in"
private let UserAccountFile: NSString = "UserFile.json"

class LSUserAccount: NSObject {
    
    var access_token: String?// = "2.00r27RPGzrWmFE98234ab1dcUgbmJC"
    var uid: String? //= "5722594907"
    
    
    /// 过期日期开发者是5年，测试者是3天
    var expires_in: TimeInterval = 0 {
        didSet {
            
            expiresDate = Date(timeIntervalSinceNow: expires_in)
            
        }
    }
    //过期日期
    var expiresDate: Date?
    
    override var description: String {
        return yy_modelDescription()
    }
    
    override init() {
        super.init()
        
        //读取文件,将json文件转化为字典
        guard let path = UserAccountFile.cz_appendDocumentDir(),
             let data = NSData(contentsOfFile: path),
         let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [AnyHashable : Any] else {
                return
        }
        
        
        //保存在模型中
        yy_modelSet(with: dict ?? [:])
        
        print("从沙盒中加载用户信息")
    
    }
    
    func saveAccount() {
        //1.将模型转字典
        var dict = (self.yy_modelToJSONObject()) as? [String: Any] ?? [:]
        
        //删除模型中不用的属性
        dict.removeValue(forKey: expires_in_String)
        
        //3.将字典序列化
       guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
        let filePath = UserAccountFile.cz_appendDocumentDir() else {
            return
        }
        
        
        //4.保存到磁盘
        (data as NSData).write(toFile: filePath, atomically: true)
        print("文件路径为：\(filePath)")
        print("保存用户数据成功")
    }

}
