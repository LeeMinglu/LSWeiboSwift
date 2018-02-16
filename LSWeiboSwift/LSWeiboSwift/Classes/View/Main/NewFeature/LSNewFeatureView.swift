//
//  LSNewFeature.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/12/17.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSNewFeatureView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var enterBtn: UIButton!
    
    @IBAction func enterBtn(_ sender: Any) {
        
        removeFromSuperview()
        
    }
    
    class func newFeatureView() -> LSNewFeatureView {
        
        let nib = UINib(nibName: "LSNewFeatureView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! LSNewFeatureView
        
        //2.添加视图
        view.frame = UIScreen.main.bounds
        return view
        
    }
    
    
    override func awakeFromNib() {
        let count = 4
        let rect = UIScreen.main.bounds
        
        for i in 0..<count {
            let imageName = "new_feature_\(i + 1)"
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = rect.offsetBy(dx: CGFloat(i) * rect.width, dy: 0)
            
            scrollView.addSubview(imageView)
        
        }
        
        scrollView.contentSize = CGSize.init(width: CGFloat(count + 1) * rect.width, height: rect.height)
        
        enterBtn.isHidden = true
        scrollView.delegate = self
        
    }
}

extension LSNewFeatureView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        
        if page == scrollView.subviews.count {
            removeFromSuperview()
        }
        
        

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width + 0.5)
        
        pageControl.currentPage = page
        
        pageControl.isHidden = (page == scrollView.subviews.count)
        
        enterBtn.isHidden = (page != scrollView.subviews.count - 1)
        
    }
    
}
