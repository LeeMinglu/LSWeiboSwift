//
//  LSMainController.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/5/7.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit
import SVProgressHUD

class LSMainController: UITabBarController {
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        setupControllers()
        setupComposeButton()
        setupTimer()
        setNewFeatureViews()
        
        delegate = self
        
        //注册用户 登录通知
        NotificationCenter.default.addObserver(self, selector: #selector(login), name: NSNotification.Name(rawValue: LSUserShouldeLoginNotification), object: nil)
        
        
    }
    
    deinit {
        self.timer?.invalidate()
        
        NotificationCenter.default.removeObserver(self)
    }
    
//    /Users/luoriver/Desktop/swift/git/LSWeiboSwift/LSWeiboSwift/LSWeiboSwift/Classes/View/Main/LSMainController.swift:25:11: Method 'supportedInterfaceOrientations()' with Objective-C selector 'supportedInterfaceOrientations' conflicts with getter for 'supportedInterfaceOrientations' from superclass 'UIViewController' with the same Objective-C selector
    
    
    
      @objc fileprivate  func composeStatus() {
        print("编写按钮")
    }
    
    @objc fileprivate  func login( n: Notification) {
//        print("用户通知 \(n)")
        
        var when = DispatchTime.now()
        
        if n.object != nil {
            SVProgressHUD.setDefaultMaskType(.gradient)
            SVProgressHUD.showInfo(withStatus: "用户登录超时，需要重新登录")
            
            //修改延时时间
            when = DispatchTime.now() + 2
        }
        
        DispatchQueue.main.asyncAfter(deadline: when) { 
            SVProgressHUD.setDefaultMaskType(.clear)
        }
        
        let nav = UINavigationController(rootViewController: LSOAthViewController())
        
        self.present(nav, animated: true, completion: nil)
        
           }
    
    lazy var compose: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
}

//解决添加按钮穿帮的问题
extension LSMainController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        //1.获取选择控制器的索引
        let index = childViewControllers.index(of: viewController)
        
        if index == 0 {
            print("点击了首页")
            //让表格滚动到顶部
            //a获取到控制器
            let nav = tabBarController.childViewControllers.first as! LSNavigationController
            let vc = nav.childViewControllers.first as! LSHomeController
            //b滚动到顶部
            let y = nav.navigationBar.bounds.height
            vc.tableview?.setContentOffset(
                CGPoint.init(x: 0, y: y-24), animated: true)
            //4> 刷新数据，增加延迟是保证先滚动到顶部再刷新数据
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: { 
                vc.loaddata()
            })
            
            //5> 清除tabItem 的badgeNumber
            vc.tabBarItem.badgeValue = nil
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
        return !viewController.isMember(of: UIViewController.self)
    }
}
 //extension切分代码块，可以将相似功能 的代码放在一下，便于代码维护
extension LSMainController {
    
    fileprivate func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timerEvent), userInfo: nil, repeats: true)
    }
    
    
    /// 获取新微博
    @objc private func timerEvent() {
        if !LSNetworkManager.shared.userLogon {
            return
        }
        
        LSNetworkManager.shared.unReadCount { (count) in
            self.tabBar.items?.first?.badgeValue = count > 0 ? "\(count)":nil
            
            UIApplication.shared.applicationIconBadgeNumber = Int(count)
        }
    }
}


// MARK: - 新视图功能处理
extension LSMainController {
    
    //设置新视图
    fileprivate func setNewFeatureViews() {
        
        //1.如果更新显示新特性，否则显示欢迎
        let v = isNewVersion ? LSNewFeature() : LSWelcomeView.welcomeView()
        
        
        
        view.addSubview(v)
        
    }
    
    private var isNewVersion: Bool {
        
        //1.取当前的版本号； 
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        
        //2.获取保存在doucument当中的版本号； 
        let path: String = ("version" as NSString).cz_appendDocumentDir()
        let sandBoxVersion = try? String(contentsOfFile: path)
        
        //3.保存当前的版本号
         try? currentVersion.write(toFile: path, atomically: true, encoding: .utf8)
        
        //4.前后版本号进行对比
        return currentVersion != sandBoxVersion
    }
}

extension LSMainController {
    
    //设置加号按钮
    fileprivate func setupComposeButton() {
        
        tabBar.addSubview(compose)
        
        let count = CGFloat(tabBar.subviews.count)
        
        let composeBtnWidth = tabBar.bounds.width / count 
        
        compose.frame = tabBar.bounds.insetBy(dx: composeBtnWidth * 2, dy: 0)
        
        compose.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
    //设置子控制器
    
    fileprivate  func setupControllers() {
        
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
        
       
        
        
        
//        let arrays = [
//            ["clsName": "LSHomeController", "title" : "首页", "imageName": "home", "visitorInfo":["imageName": "","message": "关注一些人,回到这里看看有什么惊喜"]],
//            ["clsName": "LSDiscoverController", "title" : "发现", "imageName": "discover", "visitorInfo":["imageName": "visitordiscover_image_message","message": "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"]],
//            ["clsName": ""],
//            ["clsName": "LSMessageController", "title" : "消息", "imageName": "message_center", "visitorInfo":["imageName": "visitordiscover_image_message","message": "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
//            ["clsName": "LSProfileController", "title" : "我", "imageName": "profile", "visitorInfo":["imageName": "visitordiscover_image_profile","message": "登录后，你的微博、相册、个人资料会显示在这里，展示给别人"]]
//        ]
        
//        let data = try! JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
        
//        (data as NSData).write(toFile: "/Users/luoriver/Desktop/array.json", atomically: true)
        
        var arrayM = [UIViewController]()
        
        for dict in array! {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    //使用字典创建控制器
    private func controller(dict: [String: AnyObject]) -> UIViewController {
        
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let visitorInfo = dict["visitorInfo"] as? [String : String],
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? LSBaseController.Type else {
                
            return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title
        vc.visitorDictionary = visitorInfo
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
        

       //设置字体大小及颜色
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 15)], for: UIControlState(rawValue: 0))
        
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: UIControlState.highlighted)
    
        let nav = LSNavigationController(rootViewController: vc)
        
        return nav
    
    }
    
}

