//
//  LSRefreshControl.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/3/22.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSRefreshControl: UIControl {
    
    //MARK:
    //刷新控件的父视图，下拉刷新控件适用于TableView/CollectionView
    private weak var scrollView: UIScrollView?
    
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
        
        //判断父视图
        guard  let sv = newSuperview as? UIScrollView else {
            return
        }
        
        //记录父视图
        scrollView = sv
        
        //KVO监听父视图变化
        scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
        
    }
    
    //所有的KVO都会调用此方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(scrollView?.contentOffset)
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
