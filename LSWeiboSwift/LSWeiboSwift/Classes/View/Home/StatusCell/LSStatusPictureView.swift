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
