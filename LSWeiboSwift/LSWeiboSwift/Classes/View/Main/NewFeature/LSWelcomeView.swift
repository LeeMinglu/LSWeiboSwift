//
//  LSWelcomeView.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/12/17.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import SDWebImage

class LSWelcomeView: UIView {

    @IBOutlet weak var avatarBottomConstant: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    class func welcomeView() -> LSWelcomeView {
        
        let nib = UINib(nibName: "LSWelcomeView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! LSWelcomeView

        //2.添加视图
        view.frame = UIScreen.main.bounds
        return view
  
    }
    
    override func awakeFromNib() {
        
<<<<<<< .merge_file_C0Julw
       guard let urlString = LSNetworkManager.shared.userAccount.avatar_large,
        let url = URL(string: urlString) else {
            
            return
            
        }
        
        iconImage.sd_setImage(with: url, placeholderImage: UIImage(named: "avatar_default_big"))
        
        iconImage.layer.cornerRadius = iconImage.bounds.width * 0.5
        iconImage.layer.masksToBounds = true
=======
        guard let urlString = LSNetworkManager.shared.userAccount.avatar_large,
            let url = URL(string: urlString) else {
                return
        }
        
        iconImage.sd_setImage(with: url, placeholderImage:
        UIImage(named: "avatar_default_big"))
    }
>>>>>>> .merge_file_FLvliE
    
    }
    

    override func didMoveToWindow() {
        
        avatarBottomConstant.constant = avatarBottomConstant.constant + 200
<<<<<<< .merge_file_C0Julw
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options:[], animations: {
=======
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options:[], animations: {
>>>>>>> .merge_file_FLvliE
            self.layoutIfNeeded()
            
        }) { (_) in
            
<<<<<<< HEAD
            UIView.animate(withDuration: 1.0, animations: {
                
            self.nameLabel.alpha = 1
                
            }, completion: { (_) in
                
                self.removeFromSuperview()
                
=======
            UIView.animate(withDuration: 1, animations: { 
                self.nameLabel.alpha = 1
            }, completion: { (_) in
                self.removeFromSuperview()
>>>>>>> test
            })
            
        }
    }

}
