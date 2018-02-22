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
    //设置status Model数组,微博视图懒加载
    lazy var statusList = [LSStatusViewModel]()
    var pullUpErrorTimes = 0
   
    
    /// 加载微博list
    ///
    /// - Parameters:
    ///   - pullUp: 判断是否为上拉刷新
    ///   - completion: 刷新结果回调(刷新是否成功、是否刷新表格)
    func loadStatus(pullUp: Bool,completion: @escaping ( _ isSuccess: Bool, _ shouldRefresh: Bool) ->()){
        
        
       if pullUp && pullUpErrorTimes > self.pullupTryTimes {
            completion(true, false)
            return
        }
        
        let since_id = pullUp ? 0 : (self.statusList.first?.status.id ?? 0)
        let max_id = !pullUp ? 0 : (self.statusList.last?.status.id ?? 0)
        //获取网络数据进行字典转模型
        LSNetworkManager.shared.statusList(since_id: since_id, max_id: max_id, completion: { (list, isSucess) in
            
            //判断网络是否下载成功
            if !isSucess {
                completion(false, false)
                return
            }
            
            var array = [LSStatusViewModel]()
            
            
            
            for dict in list ?? [] {
                
                print(dict["pic_urls"])
                //创建微博模型
                let status = LSStatus()
                
                //使用字典设置为模型数值
                status.yy_modelSet(with: dict)
                
                let viewModel = LSStatusViewModel(model: status)
                
                array.append(viewModel)
                
            }
            
            print(array)
            
            /*
 [LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel, LSWeiboSwift.LSStatusViewModel]
            */
            
            
          
            print("加载了 \(array.count)条数据,最后一条消息是\(String(describing: array.last?.status.text))")
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
