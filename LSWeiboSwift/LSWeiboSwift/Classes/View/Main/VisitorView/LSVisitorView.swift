//
//  LSVisitorView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/8/19.
//  Copyright © 2017年 SocererGroup. All rights reserved.
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
    //添加image
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //添加小房子
    private lazy var houseView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //添加label
    private lazy var tipLabel: UILabel = UILabel.cz_label(withText: "反正这个提示信息甭提有多长了，你还不知道么，关注一些人看看有什么惊喜吧", fontSize: 14, color: .darkGray)
    
    //添加注册按钮
    private lazy var regigterBtn:UIButton = UIButton.cz_textButton(
        "注册",
        fontSize: 16,
        normalColor: .orange,
        highlightedColor: .black,
        backgroundImageName: "common_button_white_disable")
    //添加登陆按钮
    private lazy var loginBtn:UIButton = UIButton.cz_textButton(
        "登录",
        fontSize: 16,
        normalColor: .orange,
        highlightedColor: .black,
        backgroundImageName: "common_button_white_disable")

}

extension LSVisitorView {
    func setupUI() {
        self.backgroundColor = UIColor.white
    }
}
