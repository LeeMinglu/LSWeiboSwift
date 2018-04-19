//
//  LSStatusListViewModel.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/9/10.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import Foundation
import SDWebImage



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
                
               print(dict["pic_urls"]!)
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
                
                self.cachedSinglePicture(list: array, finished: completion)
                
            }
            
        })
    }
    
    ///缓存本次下载微博中的单张图像
    
    fileprivate func cachedSinglePicture(list: [LSStatusViewModel], finished: @escaping ( _ isSuccess: Bool, _ shouldRefresh: Bool) ->()) {
        
        //调度组
        let group = DispatchGroup()
        
        var length = 0
        for vm in list {
        //遍历数组，将只有一张图像的进行缓存
            
            //判断图像的数量
            if vm.picURLs?.count != 1 {
                continue
            }
            
            guard let picString = vm.picURLs?[0].thumbnail_pic,
                let url = URL(string: picString) else {
                    continue
            }
            
           print("要缓存的URL是\(url)")
            
            //下载图像
            /*
             1.downLoad是SD_WEBimage的核心方法
             2.图像下载完成后会保存在泥沙盒中，文件路径是URL的MD5;
             3.如果沙盒中已经存在缓存的图像，以后都会从沙盒中加载图像； 
             4.不发起网络请求，回调方法也会调用
             
             */
            
            //入组
            group.enter()
           
        
        //监听调度组的情况
        group.notify(queue: DispatchQueue.main) {
            print("图像缓存完成，大小为\(length/1024)K")
            }
            
            SDWebImageManager.shared().loadImage(with: url, options: [], progress: nil) { (image, _, _, _, _, _) in
                //将图像转换成二进制数据
                if let image = image,
                    let data = UIImagePNGRepresentation(image) {
                    
                    //NSData是length属性
                    length += data.count
                    
                    //图片缓存成功，更新视图
                    vm.updateSingleImageSize(image: image)
                }
                
                //出组
                group.leave()
                print("缓存的图像的长度是\(length)")
            }
            
        /*
            SDWebImageManager.shared().downloadImage(with: url, options: [], progress: nil, completed: { (image , _ , _, _, _) in
                
                //将图像转换成二进制数据
                if let image = image,
                    let data = UIImagePNGRepresentation(image) {
                    
                    //NSData是length属性
                    length += data.count
                    
                    //图片缓存成功，更新视图
                    vm.updateSingleImageSize(image: image)
                }
                
                //出组
                group.leave()
                print("缓存的图像的长度是\(length)")
            })
           */
        }
 
        //监听调度组的情况
        group.notify(queue: DispatchQueue.main) { 
            print("图像缓存完成，大小为\(length/1024)K")
            
        }
        finished(true,true)
    
    }
    
}
