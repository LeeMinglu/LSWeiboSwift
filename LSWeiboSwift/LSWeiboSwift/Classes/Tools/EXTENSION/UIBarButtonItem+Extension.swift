//
//  UIBarButtonItem+Extension.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/25.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    
    convenience init(title: String!,fontSize: CGFloat = 15, normalColor: UIColor!, highlightedColor: UIColor!,target: Any?, action: Selector, contronEvents: UIControlEvents) {
        let button = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: normalColor, highlightedColor: highlightedColor)
        button?.addTarget(target, action: action, for: contronEvents)
        self.init(customView: button!)
        
    }
    
}
