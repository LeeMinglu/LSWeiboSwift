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
    
    func loadStatus(pullUp: Bool,completion: @escaping (_ isSuccess: Bool) ->()){
        
        
        let since_id = pullUp ? 0 : (self.statusList.first?.id ?? 0)
        let max_id = !pullUp ? 0 : (self.statusList.last?.id ?? 0)
        //获取网络数据进行字典转模型
        LSNetworkManager.shared.statusList(since_id: since_id, max_id: max_id, completion: { (list, isSucess) in
            
            guard let array = NSArray.yy_modelArray(
                with: LSStatus.self,
                json: list ?? []) as? [LSStatus]
                else {
                    completion(isSucess)
                    return
            }
            print("加载了 \(array.count)条数据,最后一条消息是\(array.last?.text)")
            
            
            if pullUp {
                self.statusList += array
            } else {
                self.statusList = array + self.statusList
            }
            
            
            completion(isSucess)
            
        })
    }
}
