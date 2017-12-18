//
//  LSWelcomeView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/12/17.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSWelcomeView: UIView {

    class func welcomeView() -> LSWelcomeView {
        
        let nib = UINib(nibName: "LSWelcomeView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! LSWelcomeView

        
        //2.添加视图
        view.frame = UIScreen.main.bounds
        return view
  
    }

}
