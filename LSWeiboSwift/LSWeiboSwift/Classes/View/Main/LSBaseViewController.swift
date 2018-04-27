//
//  LSBaseViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSBaseViewController: UIViewController {
    
    let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 44))

    lazy var navItem = UINavigationItem()
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }

}

 extension LSBaseViewController {

    func setupUI() {
       self.view.backgroundColor = UIColor.cz_color(withHex: 0xf6f6f6)
        setupNavBar()
        
    }
    
    
    /// setup NavigationController
    private func setupNavBar() {
        self.view.addSubview(navBar)

        navBar.items = [navItem]
        navBar.tintColor = UIColor.cz_color(withHex: 0xf6f6f6)
        navBar.backgroundColor = UIColor.lightGray
    
    }
    
}
