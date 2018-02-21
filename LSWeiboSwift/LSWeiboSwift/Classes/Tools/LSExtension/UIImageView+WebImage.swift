//
//  UIImageView+WebImage.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/2/21.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import SDWebImage

extension UIImageView {
    func ls_setImage(urlString: String?, placeholderImage: UIImage?, isAvatar: Bool) {
        
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
            image = placeholderImage
            return
        }
        
        sd_setImage(with: url, placeholderImage: placeholderImage, options: [], progress: nil) { (image, _, _, _) in
            
            if isAvatar {
                self.image = image?.avatarImage(size: self.bounds.size)
            }
        }
    }

}
