//
//  LSStatusListViewModel.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/10.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import Foundation



class LSStatusListViewModel {
    private let pullupTryTimes = 3
    //设置status Model数组
    lazy var statusList = [LSStatus]()
    var pullUpErrorTimes = 0
   
    
    /// 加载微博list
    ///
    /// - Parameters:
    ///   - pullUp: 判断是否为上拉刷新
    ///   - completion: 刷新结果回调(刷新是否成功、是否刷新表格)
    func loadStatus(pullUp: Bool,completion: @escaping (_ isSuccess: Bool, _ shouldRefresh: Bool) ->()){
        
        
       if pullUp && pullUpErrorTimes > self.pullupTryTimes {
            completion(true, false)
            return
        }
        
        
        let since_id = pullUp ? 0 : (self.statusList.first?.id ?? 0)
        let max_id = !pullUp ? 0 : (self.statusList.last?.id ?? 0)
        //获取网络数据进行字典转模型
        LSNetworkManager.shared.statusList(since_id: since_id, max_id: max_id, completion: { (list, isSucess) in
            
            guard let array = NSArray.yy_modelArray(with: LSStatus.self,json: list ?? []) as? [LSStatus]
                else {
                    
                    completion(isSucess, false)
                    return
            }
            print("加载了 \(array.count)条数据,最后一条消息是\(String(describing: array.last?.text))")
            print("array 数据：\(array)")
            
            
            if pullUp {
                self.statusList += array
            } else {
                self.statusList = array + self.statusList
            }
            
            
            if pullUp && array.count == 0 {
                self.pullUpErrorTimes += 1
                completion(isSucess, false)
            } else {
                completion(isSucess,true)
            }
            
        })
    }
}
