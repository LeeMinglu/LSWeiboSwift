//
//  LSBaseController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSBaseController: UIViewController {

    let navBar = UINavigationBar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    lazy var navbarItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        self.view.backgroundColor = UIColor.cz_random()
        // Do any additional setup after loading the view.
    }
    
    override var title: String? {
        didSet {
           navbarItem.title = title
        }
    }

}

extension LSBaseController {
    func setupUI() {
        self.view.backgroundColor = UIColor.cz_random()
        self.view.addSubview(navBar)
        navBar.items = [navbarItem]
    }
}
