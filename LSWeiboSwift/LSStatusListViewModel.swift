//
//  LSStatusListViewModel.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/10.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import Foundation

class LSStatusListViewModel {
    
    //设置status Model数组
    lazy var statusList = [LSStatus]()
    
    func loadStatus(completion: @escaping (_ isSuccess: Bool) ->()) {
        
        
        //获取网络数据进行字典转模型
        LSNetworkManager.shared.statusList { (list, isSucess) in
            
            guard let array = NSArray.yy_modelArray(
                with: LSStatus.self,
                json: list ?? []) as? [LSStatus]
            else {
                completion(isSucess)
                return
            }
            
            self.statusList += array
            
            completion(isSucess)
            
        }
    }
}
