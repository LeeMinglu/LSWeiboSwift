//
//  LSStatusCell.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/18.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSStatusCell: UITableViewCell {
    
    var viewModel: LSStatusViewModel? {
        didSet {
            
            statusLabel.text = viewModel?.status.text
            nameLabel.text = viewModel?.status.user?.screen_name
            memberIconView.image = viewModel?.memberIcon
            vipIconView.image = viewModel?.vipIcon
            iconView.ls_setImage(urlString: viewModel?.status.user?.profile_image_url, placeholderImage: UIImage(named: "avatar_default_big"), isAvatar: true)
            
            toolBar.viewModel = viewModel
            
            statusPictureView.viewModel = viewModel
            //代码设置配图的高度
         //   statusPictureView.heightCons.constant = viewModel?.pictureViewSize.height ?? 0
            //设置配图视图的数据(被转发和原创)
       //     statusPictureView.urls = viewModel?.status.pic_urls
            statusPictureView.urls = viewModel?.picURLs
            //测试配图视图的URL数据
            /*
            if (viewModel?.status.pic_urls?.count ?? 0) > 4 {
                var picUrls = viewModel!.status.pic_urls!
                picUrls.removeSubrange((picUrls.startIndex + 4)..<picUrls.endIndex)
            
                statusPictureView.urls = picUrls
            } else {
                statusPictureView.urls = viewModel?.status.pic_urls
            }
            
            */
           retweetLabel?.text = viewModel?.retweetText
            
        }
    }
    
    //头像
    @IBOutlet weak var iconView: UIImageView!
    
    //网名
    @IBOutlet weak var nameLabel: UILabel!
    
    //会员图标
    @IBOutlet weak var memberIconView: UIImageView!
    
    //发表时间
    @IBOutlet weak var timeLabel: UILabel!
    
    //来源
    @IBOutlet weak var sourceLabel: UILabel!
    
    //认证图标
    @IBOutlet weak var vipIconView: UIImageView!
    
    //正文
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var toolBar: LSToolBar!
    
    @IBOutlet weak var statusPictureView: LSStatusPictureView!
    //被转发微博Label
    @IBOutlet weak var retweetLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //离屏渲染--异步绘制
        self.layer.drawsAsynchronously = true
        
        //栅格化 异步之后会生成一张独立的图片，cell在滚动的时候滚动的就是这张图片
        //cell 优化尽量减少图层的数量相当于只有一层 
        //停止滚动之后可以收到监听
        self.layer.shouldRasterize = true
        //使用栅格化必须注意使用分辨率
        self.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
