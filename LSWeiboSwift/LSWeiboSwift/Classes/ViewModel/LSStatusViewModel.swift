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
    
    //会员图标
    var memberIcon: UIImage?
    
    //认证图标
    var vipIcon: UIImage?
    //转发
    var retweetString: String?
    //评论
    var comentString: String?
    //赞
    var likeString: String?
    //如果是被转发的微博，一定没有配图
    var picURLs: [LSPicture]? {
        return status.retweeted_status?.pic_urls ?? status.pic_urls
    }
    
    //配图视图的大小
    var pictureViewSize = CGSize()
    
    init(model: LSStatus) {
        
        self.status = model
        
        if (model.user?.mbrank)! > 0 || (model.user?.mbrank)! < 7 {
        
        }
        let imageName = "common_icon_membership_level\(model.user?.mbrank ?? 1)"
        memberIcon = UIImage(named: imageName)
        
     //   print("等级名称+\(imageName)")
        
        //认证图标 -1:没有认证； 2，3，5:企业认证；  220：草根
        switch model.user?.verified_type ?? -1 {
        case 0:
            vipIcon = UIImage(named: "avatar_vip")
        case 2,3,5:
            vipIcon = UIImage(named: "avatar_enterprise_vip")

        case 0:
            vipIcon = UIImage(named: "avatar_grassroot")

        default:
            break
        }
        
        // MARK: 测试数据代码
    //    model.reposts_count = Int(arc4random_uniform(100000))
        
        
        retweetString = countString(count: model.reposts_count, DefaultString: "转发")
        comentString = countString(count: model.comments_count, DefaultString: "评论")
        likeString = countString(count: model.attitudes_count, DefaultString: "赞")
        
    //    pictureViewSize = calculatePictureViewSize(count: status.pic_urls?.count)
        pictureViewSize = calculatePictureViewSize(count: picURLs?.count)
    }
    
    var description: String {
        return  status.description
    }
    
    //
    /// 根据图像的数量来计算view的高度
    
    private func calculatePictureViewSize(count: Int?) -> CGSize{
        
        if count == 0 || count == nil {
            return CGSize()
        }
        
       
        
        //图片视图的高度
        
        //视图的高度由数量来决定
        //图片的行数
        let row = CGFloat((count! - 1) / 3 + 1)
        
        let LSStatusPictureViewHeight = LSStatusPictureViewOutterMargin + CGFloat((row - 1)) * LSStatusPictureViewInnerMargin + CGFloat(row) * LSStatusPictureViewItemWidth
        
        return CGSize(width: LSStatusPictureViewWidth, height: LSStatusPictureViewHeight)

    }
    
    //使用数字反馈一个字符串
    private func countString(count: Int, DefaultString: String) -> String {
    
        if count == 0 {
            return DefaultString
        }
        
        if count < 10000 {
            return count.description
        }
        
       return String(format: "%.02f万", Double(count)/10000)
    }
    
}
