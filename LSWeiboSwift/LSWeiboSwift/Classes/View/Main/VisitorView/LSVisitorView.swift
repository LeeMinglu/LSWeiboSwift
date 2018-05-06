//
//  LSVisitorView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/30.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSVisitorView: UIView {
    
    var visitorInfo: [String: String]? {
        didSet {
            guard let message = visitorInfo?["message"],
                let imageName = visitorInfo?["imageName"] else {return}
            
            if imageName == "" {
                return
            }
            
            tipeLabel.text = message
            print(message)
            iconView.image = UIImage(named: imageName)
            
            houseView.isHidden = true
            maskIconView.isHidden = true
            
        }
    }
    
    lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
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
        //设置背影颜色与剩余的颜色一致
        self.backgroundColor = UIColor.cz_color(withRed: 237, green: 237, blue: 237)
        addView()
        setLayout()
        
    }
    
    func addView() {
        self.addSubview(iconView)
        self.addSubview(maskIconView)
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
        
//        maskIconView
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskIconView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["maskIconView": maskIconView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskIconView]-(-35)-[regigterBtn]", options: .directionLeadingToTrailing, metrics: nil, views: ["maskIconView": maskIconView, "regigterBtn": regigterBtn]))
       
        
        /**
         
         //先打一些大家熟悉的代码，放松一下心情
         //创建View填到父视图
         UIView *redView = [[UIView alloc]init];
         redView.backgroundColor = [UIColor redColor];
         redView.translatesAutoresizingMaskIntoConstraints = NO;
         [self.view addSubview:redView];
         //接下来开始写API所需要的参数了
         //format参数
         //Hvfl与Vvfl分别是水平方向与垂直方向的约束，等下之后会有解析
         NSString *Hvfl = @"H:|-margin-[redView(50)]";
         NSString *Vvfl = @"V:|-margin-[redView(100)]";
         //设置margin的数值
         NSDictionary *metrics = @{ @"margin":@20};
         //把要添加约束的View转成字典
         NSDictionary *views = NSDictionaryOfVariableBindings(redView);//这个方法会自动把传入的参数以字典的形式返回，字典的KEY就是其本身的名字
         //如@{@"redView"：redView}
         
         //添加对齐方式，
         NSLayoutFormatOptions ops = NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllTop;//左边与顶部
         
         //参数已经设置完了，接收返回的数组，用以self.view添加
         NSArray *Hconstraints = [NSLayoutConstraint constraintsWithVisualFormat:Hvfl options:ops metrics:metrics views:views];
         
         NSArray *Vconstraints = [NSLayoutConstraint constraintsWithVisualFormat:Vvfl options:ops metrics:metrics views:views];
         //self.view分别添加水平与垂直方向的约束
         [self.view addConstraints:Hconstraints];
         [self.view addConstraints:Vconstraints];
        
         链接：https://www.jianshu.com/p/757cc57fd9ea
         
         */
    addConstraints(NSLayoutConstraint.constraints(
        withVisualFormat: "H:|-0-[maskIconView]-0-|",
        options: .directionLeadingToTrailing,
        metrics: nil,
        views: ["maskIconView": maskIconView]))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[maskIconView]-(-35)-[LogonBtn]",
            options: .directionLeadingToTrailing,
            metrics: nil,
            views: ["maskIconView": maskIconView, "LogonBtn": LogonBtn]))

        
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
