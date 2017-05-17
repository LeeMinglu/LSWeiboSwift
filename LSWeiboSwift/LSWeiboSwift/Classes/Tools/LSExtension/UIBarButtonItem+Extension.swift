//
//  Button+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/17.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    
    /// 自定义UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - fontSize: 字体大小
    ///   - normalColor: 字体普通颜色
    ///   - highlightedColor: 字体高亮颜色
    ///   - target: target
    ///   - action: 执行操作
    ///   - controlEvents: 触摸事件
    convenience init(title: String?, fontSize: CGFloat = 15, normalColor: UIColor, highlightedColor: UIColor, target: Any?, action: Selector, controlEvents: UIControlEvents) {
        let button = UIButton.cz_textButton(title, fontSize: 14, normalColor: normalColor, highlightedColor: highlightedColor)
        button?.addTarget(target, action: action, for: controlEvents)
        
        self.init(customView: button!)
    }
}
