//
//  Button+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/17.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    
    /// 创建 UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize,默认16号
    ///   - target: target
    ///   - action: action
    ///   - isBack: 是否是返回按钮，如果是，加上箭头
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector, isBack: Bool = false) {
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        
        //实例化 uibarbuttonitem
        self.init(customView: btn)
    }
}
