//
//  LSRefrshView.swift
//  刷新控件002
//
//  Created by 李明禄 on 2018/3/28.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSRefrshView: UIView {
    
    var refreshState: LSrefreshState = .Normal

    //提示标签
    @IBOutlet weak var RefreshLabel: UILabel!
    //提示图标
    @IBOutlet weak var iconView: UIImageView!
    //指示器
    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    
    class func refreshView() -> LSRefrshView {
        let nib = UINib(nibName: "LSRefreshView", bundle: nil)
        
        let v = nib.instantiate(withOwner: nil, options: nil)[0] as! LSRefrshView
        return v
        
        
    
    }
    

}
