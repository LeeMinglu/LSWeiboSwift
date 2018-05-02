//
//  LSVisitorView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/30.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
       setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}

extension LSVisitorView {
    
    func setupUI() {
        
         self.backgroundColor = UIColor.blue
    }
}
