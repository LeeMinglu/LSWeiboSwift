//
//  LSToolBar.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/21.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSToolBar: UIView {
    
    var viewModel: LSStatusViewModel? {
        didSet {
            retweet.setTitle("\(viewModel?.status.reposts_count)" , for: [])
            comment.setTitle("\(viewModel?.status.comments_count)" , for: [])
            like.setTitle("\(viewModel?.status.attitudes_count)" , for: [])
        }
    }

    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var comment: UIButton!
    @IBOutlet weak var like: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
