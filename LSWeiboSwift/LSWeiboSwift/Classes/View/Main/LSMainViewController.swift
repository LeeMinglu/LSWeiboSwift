//
//  LSMainViewController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2018/4/19.
//  Copyright © 2018年 SocererGroup. All rights reserved.
//

import UIKit

class LSMainViewController: UITabBarController {
    
    lazy var compose: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupCompose()
//        view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension LSMainViewController {
    
    /// 设置编辑按钮逻辑
    fileprivate func setupCompose() {
        let width = UIScreen.main.bounds.width / CGFloat(tabBar.subviews.count)
        let height = tabBar.bounds.height
        let x = width * 2
//      compose.frame = CGRect(x: x, y: 0, width: width, height: height)
        compose.frame = tabBar.bounds.insetBy(dx: x, dy: 0)
        compose.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        
        self.tabBar.addSubview(compose)
        
        compose.addTarget(self, action: #selector(clickCompose), for: .touchUpInside)
        
    }
    
    @objc private func clickCompose() {
        print("click compose")
        
    }
    
}

//设置控制器逻辑
extension LSMainViewController {
    
    /// 设置控制器
    fileprivate func setupViewControllers() {
        /**
        let array = [
            
            ["clsName": "LSHomeViewController", "title" : "首页", "imageName": "home"],
            ["clsName": "LSDiscoverViewController", "title" : "发现", "imageName": "discover"],
            ["clsName": ""],
            ["clsName": "LSMessageViewController", "title" : "消息", "imageName": "message_center"],
            ["clsName": "LSProfileViewController", "title" : "我", "imageName": "profile"],
 
            
            ["clsName": "LSHomeViewController", "title" : "首页", "imageName": "home", "visitorInfo":["imageName": "","message": "关注一些人,回到这里看看有什么惊喜"]],
            ["clsName": "LSDiscoverViewController", "title" : "发现", "imageName": "discover", "visitorInfo":["imageName": "visitordiscover_image_message","message": "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"]],
            ["clsName": ""],
            ["clsName": "LSMessageViewController", "title" : "消息", "imageName": "message_center", "visitorInfo":["imageName": "visitordiscover_image_message","message": "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
            ["clsName": "LSProfileViewController", "title" : "我", "imageName": "profile", "visitorInfo":["imageName": "visitordiscover_image_profile","message": "登录后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
 
        ]
        
        (array as NSArray).write(toFile: "/Users/luoriver/Desktop/lll.plist", atomically: true)
        */
        /**
         let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
         let jsonPath = (docDir as NSString).appendingPathComponent("main2.json")
         
         var data = NSData(contentsOfFile: jsonPath)
         //        print(data ?? "没有数据")
         
         print(docDir)
         
         if data == nil {
         let path = Bundle.main.path(forResource: "main.json", ofType: nil)
         data = NSData.init(contentsOfFile: path!)
         }
         
         guard let array  = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]]
         else {
         return
         }

         
         */
       let DocDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let path = (DocDir as NSString).appending("main 2.json")
        
        var data = NSData(contentsOfFile: path)
        
        if data == nil {
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            
            data = NSData(contentsOfFile: path!)
        }
        
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]] else {
            
            return
        }
        
        
        var VCArray = [UIViewController]()
        
        for dict in array! {
            
            let vc = dictToController(dict: dict)
            VCArray.append(vc)
            
        }
        
        viewControllers = VCArray
    
    }
   
    private func dictToController(dict: [String: AnyObject]) -> UIViewController {
        
        guard let clsName = dict["clsName"] as? String,
        let title = dict["title"] as? String,
        let imageName = dict["imageName"] as? String,
        let visitorInfo = dict["visitorInfo"] as? [String: String],
//        let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? LSBaseViewController.Type
        else {
        
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        vc.visitorInfo = visitorInfo
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.attachment: UIFont.systemFont(ofSize: 15)], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.orange], for: .highlighted)
//        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 15)], for: UIControlState(rawValue: 0))


        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")
        let nav = LSNavigationViewController(rootViewController: vc)
        return nav
    }
    
}
