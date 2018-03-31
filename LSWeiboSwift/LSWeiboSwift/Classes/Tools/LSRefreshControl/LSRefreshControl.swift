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
    
    lazy var refreshView: LSRefrshView = LSRefrshView.refreshView()
    
    
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
    
    //本视图从父视图上移除
    //所有 的KVO监听都是这个思路
    //所有下拉刷新都是监听父视图的contentOffset
    override func removeFromSuperview() {
        superview?.removeObserver(self, forKeyPath: "contentOffset")
        super.removeFromSuperview()
    }
    
    //所有的KVO都会调用此方法
    //通常只监听某一个对象的几个属性，如果属性太多，方法会很乱
    //观察者模式，在不需要的时候都需要释放
        //通知中心，如果不释放什么也没会发生； 
        //KVO:  如果不释放，会崩溃
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //tableView的contentInset的top与ContentOffset的y有很大关系
        print(scrollView!.contentOffset)
        
        guard  let sv = scrollView else {
            return
        }

        
        let height = -(sv.contentOffset.y + sv.contentInset.top)
        
        self.frame = CGRect(x: 0, y: -height, width: sv.bounds.width, height: height)
        
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
        
        
        addSubview(refreshView)
        
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        
        refreshView.backgroundColor = superview?.backgroundColor
        
        addConstraints([NSLayoutConstraint(
            item: refreshView,
            attribute: .centerX,
            relatedBy: .equal ,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0)]
        )
        
        addConstraints([NSLayoutConstraint(
            item: refreshView,
            attribute: .bottom,
            relatedBy: .equal ,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0)]
        )
        
        addConstraints([NSLayoutConstraint(
            item: refreshView,
            attribute: .width,
            relatedBy: .equal ,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: refreshView.bounds.width)]
        )
        
        addConstraints([NSLayoutConstraint(
            item: refreshView,
            attribute: .height,
            relatedBy: .equal ,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: refreshView.bounds.height)]
        )

    }

}
