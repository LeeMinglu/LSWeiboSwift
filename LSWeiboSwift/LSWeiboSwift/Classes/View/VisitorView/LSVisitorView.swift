//
//  LSVisitorView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/30.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSVisitorView: UIView {
    
    lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    lazy var houseView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    lazy var tipeLabel: UILabel = UILabel.cz_label(withText: "字符串非常长，你都不知道有多长", fontSize: 16, color: .orange)
    
    lazy var registerBtn: UIButton = UIButton.cz_textButton("注册", fontSize: 15, normalColor: .orange, highlightedColor: .black, backgroundImageName: "common_button_white_disable")
    
    
    lazy var LogonBtn: UIButton = UIButton.cz_textButton("登陆", fontSize: 15, normalColor: .orange, highlightedColor: .black,backgroundImageName: "common_button_white_disable")

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
        self.backgroundColor = UIColor.white
        addView()
        setLayout()
        
    }
    
    func addView() {
        self.addSubview(iconView)
        self.addSubview(houseView)
        self.addSubview(tipeLabel)
        self.addSubview(LogonBtn)
        self.addSubview(registerBtn)
    }
    
    func setLayout() {
        
//        1.取消所有的autoreSize
        for v in subviews {
            
            v.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
//        2.使用苹果原生布局
        
        //iconView
        addConstraint(NSLayoutConstraint(
            item: iconView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0))
        addConstraint(NSLayoutConstraint(
            item: iconView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerY,
            multiplier: 1.0,
            constant: -60
        ))
        
//        houseView
        addConstraint(NSLayoutConstraint(
            item: houseView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0
        ))
        addConstraint(NSLayoutConstraint(
            item: houseView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0
        ))
        
        //tipeLabel
        addConstraint(NSLayoutConstraint(
            item: tipeLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0
        ))
        addConstraint(NSLayoutConstraint(
            item: tipeLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 20
        ))
        addConstraint(NSLayoutConstraint(
            item: tipeLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 236
        ))
        //注册
        addConstraint(NSLayoutConstraint(
            item: registerBtn,
            attribute: .left,
            relatedBy: .equal,
            toItem: tipeLabel,
            attribute: .left,
            multiplier: 1.0,
            constant: 0
        ))
        addConstraint(NSLayoutConstraint(
            item: registerBtn,
            attribute: .top,
            relatedBy: .equal,
            toItem: tipeLabel,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 10
        ))
        addConstraint(NSLayoutConstraint(
            item: registerBtn,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 100
        ))
        
        //登陆
        addConstraint(NSLayoutConstraint(
            item: LogonBtn,
            attribute: .right,
            relatedBy: .equal,
            toItem: tipeLabel,
            attribute: .right,
            multiplier: 1.0,
            constant: 0
        ))
        addConstraint(NSLayoutConstraint(
            item: LogonBtn,
            attribute: .top,
            relatedBy: .equal,
            toItem: tipeLabel,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 10
        ))
        addConstraint(NSLayoutConstraint(
            item: LogonBtn,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 100
        ))
        
    }
}
