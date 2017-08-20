//
//  LSVisitorView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/8/19.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSVisitorView: UIView {
    
    //MARK: -设置visitorInfo
    var visitorInfo: [String: String]? {
        didSet {
            guard let imageName = visitorInfo?["imageName"],
                let  message = visitorInfo?["message"]
                else {
                    return
            }
            
            if imageName == "" {
                startAnimate()
                return
            }
            
            tipLabel.text = message
            iconView.image = UIImage(named: imageName)
            
            houseView.isHidden = true
            maskIconView.isHidden = true
        }
    }
    
    //MARK: - 旋转动画
    fileprivate func startAnimate()  {
        let animate = CABasicAnimation(keyPath: "transform.rotation")
        
        animate.toValue = Double.pi
        animate.duration = 20
        animate.repeatCount = MAXFLOAT
        
        //必须添加在动作之前，否则是不生效的
        animate.isRemovedOnCompletion = false
        
        iconView.layer.add(animate, forKey: nil)
        
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK:- 懒加载视图
    //添加image
    fileprivate lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    //添加MaskIconImage
    fileprivate lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    //添加小房子
    fileprivate lazy var houseView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //添加label
    fileprivate lazy var tipLabel: UILabel = UILabel.cz_label(withText: "反正这个提示信息甭提有多长了，你还不知道么，关注一些人看看有什么惊喜吧", fontSize: 14, color: .darkGray)
    
    //添加注册按钮
    fileprivate lazy var regigterBtn:UIButton = UIButton.cz_textButton(
        "注册",
        fontSize: 16,
        normalColor: .orange,
        highlightedColor: .black,
        backgroundImageName: "common_button_white_disable")
    //添加登陆按钮
    fileprivate lazy var loginBtn:UIButton = UIButton.cz_textButton(
        "登录",
        fontSize: 16,
        normalColor: .orange,
        highlightedColor: .black,
        backgroundImageName: "common_button_white_disable")

}

extension LSVisitorView {
    func setupUI() {
        self.backgroundColor = UIColor.cz_color(withRed: 237, green: 237, blue: 237)
        
        //1. 添加视图
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(regigterBtn)
        addSubview(loginBtn)
        
        tipLabel.textAlignment = .center
        
        //sb使用autolayout  代码使用autoresize
        //2. 取消autoresize
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //3.使用苹果原生设置布局
        //设置iconView
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
            constant: -60))
        
        //设置houseView
        addConstraint(NSLayoutConstraint(
            item: houseView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0))
        
        addConstraint(NSLayoutConstraint(
            item: houseView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 20))
        
        //设置tipLabel
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0))
        
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: iconView,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 20))
        
        //在Label中显示内容换行
        addConstraint(NSLayoutConstraint(
            item: tipLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 236))
        
        //设置注册按钮
        addConstraint(NSLayoutConstraint(
            item: regigterBtn,
            attribute: .left,
            relatedBy: .equal,
            toItem: tipLabel,
            attribute: .left,
            multiplier: 1.0,
            constant: 0))
        
        addConstraint(NSLayoutConstraint(
            item: regigterBtn,
            attribute: .top,
            relatedBy: .equal,
            toItem: tipLabel,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 10))
        
        addConstraint(NSLayoutConstraint(
            item: regigterBtn,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 100))
        
        //设置登陆按钮
        addConstraint(NSLayoutConstraint(
            item: loginBtn,
            attribute: .right,
            relatedBy: .equal,
            toItem: tipLabel,
            attribute: .right,
            multiplier: 1.0,
            constant: 0))
        
        addConstraint(NSLayoutConstraint(
            item: loginBtn,
            attribute: .top,
            relatedBy: .equal,
            toItem: tipLabel,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 10))
        
        addConstraint(NSLayoutConstraint(
            item: loginBtn,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 100))
        
        
        //使用VFL布局maskIcon
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskIconView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["maskIconView": maskIconView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskIconView]-(0)-[regigterBtn]", options: .directionLeadingToTrailing, metrics: nil, views: ["maskIconView": maskIconView, "regigterBtn": regigterBtn]))
        

        
    }
}
