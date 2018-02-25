//
//  LSWeiBoCommon.swift
//  LSWeiboSwift
//
//  Created by 李明禄 on 2017/10/11.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import Foundation

// MARK: -----应用程序信息------
//应用程序ID
let AppKey = "3749979107"
//应用程序加密信息
let AppSecret = "7c6caa278636b325243e07f976bdf72e"
//回调URI--登录程序跳转的URI,参数以get形式进行拼接
let RedirectURL = "https://www.baidu.com"


// MARK: -----全局通知定义-----
//登陆通知
let LSUserShouldeLoginNotification = "LSUserShouldeLoginNotification"
//用户登陆成功通知
let LSUSERLoginSuccessNotification = "LSUSERLoginSuccessNotification"


//MARK:-----配图视图信息-----
//外部间距
let LSStatusPictureViewOutterMargin = CGFloat(12)

//图片的内部间距
let LSStatusPictureViewInnerMargin = CGFloat(3)

//图片视图的宽度
let LSStatusPictureViewWidth = UIScreen.main.bounds.width - 2 * LSStatusPictureViewOutterMargin

//图片视图内每个图片的宽度
let LSStatusPictureViewItemWidth = (LSStatusPictureViewWidth - 2 * LSStatusPictureViewInnerMargin) / 3
