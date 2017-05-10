//
//  LSBaseController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.cz_random()
        // Do any additional setup after loading the view.
    }

}

extension LSBaseController {
    func setupUI() {
        self.view.backgroundColor = UIColor.cz_random()
    }
}
