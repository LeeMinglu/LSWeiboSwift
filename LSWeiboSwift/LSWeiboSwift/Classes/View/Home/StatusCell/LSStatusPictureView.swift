//
//  LSStatusPicture.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/22.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSStatusPictureView: UIView {
    @IBOutlet weak var heightCons: NSLayoutConstraint!
    
    var urls:[LSPicture]? {
        didSet {
            
            for v in subviews {
                v.isHidden = true
                
                var index = 0
                for url in urls ?? [] {
                    
                    let iv = subviews[index] as! UIImageView
                    iv.isHidden = false
                    
                    iv.ls_setImage(urlString: url.thumbnail_pic, placeholderImage: nil, isAvatar: false)
                    
                    index += 1
                    
                
                }
            }
        
        }
    }
    
    override func awakeFromNib() {
        setupUI()
        
    }

    
}

extension LSStatusPictureView {
    fileprivate func setupUI() {
       //删除超越边界的部分view
        clipsToBounds = true
        let count = 3
        
        
        let rect = CGRect(x: 0, y: LSStatusPictureViewOutterMargin, width: LSStatusPictureViewItemWidth, height: LSStatusPictureViewItemWidth)
        for i in 0 ..< count * count {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.red
          
            //设置图像自适应图像大小，以下两行代码都需要设置，你可以自己去掉第二行试试 效果就知道了
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            //行对应于Y
            let row = CGFloat(i / count)
            //列对应于X
            let colum = CGFloat(i % count)
            
            let offSetX = colum * (LSStatusPictureViewItemWidth + LSStatusPictureViewInnerMargin)
            let offSetY = row * (LSStatusPictureViewItemWidth + LSStatusPictureViewInnerMargin)
            
            imageView.frame = rect.offsetBy(dx: offSetX, dy: offSetY)
         
         //   imageView.frame = rect
            addSubview(imageView)
        }
        
        
    }
}
