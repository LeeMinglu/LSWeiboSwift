//
//  LSRefrshView.swift
//  刷新控件002
//
//  Created by 李明禄 on 2018/3/28.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSRefrshView: UIView {
    
    var refreshState: LSrefreshState = .Normal {
        didSet {
            switch refreshState {
            case .Normal:
                RefreshLabel.text = "继续使劲拉"
                UIView.animate(withDuration: 0.25, animations: { 
                    self.iconView.transform = CGAffineTransform.identity
                })
            case .Pulling:
                RefreshLabel.text = "放手就刷新"
                
                UIView.animate(withDuration: 0.25, animations: {
                    
                    self.iconView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi - 0.0001))
                })
                
            case .WillRefresh:
                RefreshLabel.text = "正在刷新"
                
                //隐藏提示图标
                iconView.isHidden = true
                //显示刷新图标
                Indicator.startAnimating()
               
                
                
            }
        }
    }

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
