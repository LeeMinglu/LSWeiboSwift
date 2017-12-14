//
//  LSTitleButton.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/12/14.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSTitleButton: UIButton {

    init(title: String?) {
        super.init(frame: CGRect())
        if title == nil {
            setTitle("首页", for: .normal)
        } else {
            setTitle(title, for: .normal)
        }
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        setTitleColor(UIColor.black, for: .normal)
        setTitleColor(UIColor.orange, for: .normal)
        
        setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        
        
        sizeToFit()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
