//
//  LSRefreshControl.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/3/22.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSRefreshControl: UIControl {
       
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        setupUI()
    }
    //willMove addSubview的时候会调用
    //当添加到视力的时候，superView是父视图
    //当父视力被移除时，superView为Nil
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        print(newSuperview)
        
    }
    //开始刷新
    func beginRefreshing() {
    
    }
    
    //结束刷新
    func endRefreshing() {
    
    }


}

extension LSRefreshControl {
    
    fileprivate func setupUI() {
        backgroundColor = UIColor.orange
    }

}
