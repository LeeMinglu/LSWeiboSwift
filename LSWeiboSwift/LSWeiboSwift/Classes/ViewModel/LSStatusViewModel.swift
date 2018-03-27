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
    
    //构造函数
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
        
        //被转发微博的文字 s
         retweetText = "@" + (status.retweeted_status?.user?.screen_name ?? "")
        
        retweetText = (retweetText!) + (status.retweeted_status?.text ?? "")
  //      print("转发微博的文字为 \(retweetText ?? "")")
        
        updateRowHeight()
        
        
    }
    
    //更新单个微博的行高
    func updateRowHeight() {
        
        //微博：分隔视图行高（12）+间距 12+ icon高度34 +间距12——文本高度（需要计算）+图片高度（需要计算）+间距12+toolbar高度35
        
        //被转发微博 分隔视图行高（12）+间距 12+ icon高度34 +间距12——文本高度（需要计算）+图片高度（需要计算）+间距12+toolbar高度35 + 文本高度 + 间距
        
        let margin: CGFloat = 12
        let iconHeight: CGFloat = 34
        let toolBarHeight: CGFloat = 35
        let originalFont = UIFont.systemFont(ofSize: 15)
        let retweetFont = UIFont.systemFont(ofSize: 14)
        
        var height:CGFloat = 0
        
        let textSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        
        //1.计算顶部的位置
        height = margin * 2 + iconHeight + margin
        
        //2.计算内容的高度
        if let text = status.text {
            height += (text as NSString).boundingRect(
                with: textSize,
                options: [.usesLineFragmentOrigin],
                attributes: [NSFontAttributeName: originalFont],
                context: nil).height
        }
        
        //3.判断是否为转发微博
        if status.retweeted_status != nil {
            
            height += margin * 2

            if let text = retweetText {
                height += (text as NSString).boundingRect(
                    with: textSize,
                    options: [.usesLineFragmentOrigin],
                    attributes: [NSFontAttributeName: retweetFont],
                    context: nil).height
                
            }
        }
        
        //4.配图视图的高度
        height += pictureViewSize.height
        
        height += margin
        
        //5.底部工具栏
        height += toolBarHeight
        
        rowHeight = height
    
    }
    
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
    
   
    
    var rowHeight: CGFloat = 0
    
    var retweetText : String?
    
    var description: String {
        return  status.description
    }
    
    ///使用单个图像，更新配图视图的大小
    func updateSingleImageSize(image: UIImage) {
        var size = image.size
        let maxWidth : CGFloat = 500
        let minWidth: CGFloat = 50
        
        //过宽图片处理
        if size.width > maxWidth {
            
            size.width = maxWidth
            size.height = image.size.height * size.width / image.size.width
        }
        
        //过窄图片处理
        if size.width < minWidth {
            size.width = minWidth
            size.height = image.size.height * size.width / image.size.width / 4
        }
        
        
        size.height += LSStatusPictureViewOutterMargin
        
        pictureViewSize = size
        
        //更新 行高
        updateRowHeight()
    
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
