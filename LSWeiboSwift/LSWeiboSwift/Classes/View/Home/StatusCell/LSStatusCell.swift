//
//  LSStatusCell.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/18.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSStatusCell: UITableViewCell {
    
    //头像
    @IBOutlet weak var iconView: UIImageView!
    
    //网名
    @IBOutlet weak var nameLabel: UILabel!
    
    //会员图标
    @IBOutlet weak var memberIconView: UIImageView!
    
    //发表时间
    @IBOutlet weak var timeLabel: UILabel!
    
    //来源
    @IBOutlet weak var sourceLabel: UILabel!
    
    //认证图标
    @IBOutlet weak var vipIconView: UIImageView!
    
    //正文
    @IBOutlet weak var statusLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}