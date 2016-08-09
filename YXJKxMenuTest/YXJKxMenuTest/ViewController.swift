//
//  ViewController.swift
//  YXJKxMenuTest
//
//  Created by yuanxiaojun on 16/8/9.
//  Copyright © 2016年 袁晓钧. All rights reserved.
//

import UIKit
import YXJKxMenu

class ViewController: UIViewController {

    var ScreenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }

    var ScreenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showMenu(sender: UIButton) {
        var menuArray: [YXJKxMenuItem] = []

        for i in 0..<4 {
            let menuItem = YXJKxMenuItem("选项\(i)", image: UIImage(named: "\(i)"), target: self, action: #selector(ViewController.choiceTypeResult(_:)))
            menuArray.append(menuItem)
        }

        YXJKxMenu.setTitleFont(UIFont.systemFontOfSize(14))

        let option = OptionalConfiguration(
            arrowSize: 10,
            marginXSpacing: 10,
            marginYSpacing: 10,
            intervalSpacing: 10,
            menuCornerRadius: 3,
            maskToBackground: true,
            shadowOfMenu: false,
            hasSeperatorLine: true,
            seperatorLineHasInsets: false,
            textColor: Color(R: 82 / 255.0, G: 82 / 255.0, B: 82 / 255.0),
            menuBackgroundColor: Color(R: 1, G: 1, B: 1),
            setWidth: (ScreenWidth - 15 * 2) / 2)

        let rect = CGRectMake(sender.frame.origin.x, 0, sender.frame.size.width, 64)

        // 特别说明,这里的fromRect之所以没有直接使用sender.frame是因为该button的高度并没有占满整个navigationBar的高度，所以直接填写的titleBar加上navigationBar的高度(64)
        YXJKxMenu.showMenuInView(self.view, fromRect: rect, menuItems: menuArray, withOptions: option)
    }

    @IBAction func showMenu1(sender: UIButton) {
        var menuArray: [YXJKxMenuItem] = []

        for i in 0..<5 {
            let menuItem = YXJKxMenuItem("选项\(i)", image: nil, target: self, action: #selector(ViewController.choiceTypeResult(_:)))
            menuArray.append(menuItem)
        }

        YXJKxMenu.setTitleFont(UIFont.systemFontOfSize(14))

        let option = OptionalConfiguration(
            arrowSize: 10,
            marginXSpacing: 10,
            marginYSpacing: 10,
            intervalSpacing: 30,
            menuCornerRadius: 3,
            maskToBackground: true,
            shadowOfMenu: false,
            hasSeperatorLine: true,
            seperatorLineHasInsets: false,
            textColor: Color(R: 82 / 255.0, G: 82 / 255.0, B: 82 / 255.0),
            menuBackgroundColor: Color(R: 1, G: 1, B: 1),
            setWidth: 0)

        // 特别说明,这里直接使用sender.frame是因为该框架能正确计算出YXJKxMenu将展示的位置
        YXJKxMenu.showMenuInView(self.view, fromRect: sender.frame, menuItems: menuArray, withOptions: option)
    }

    // MAKR:实现YXJKxMenu协议
    func choiceTypeResult(item: YXJKxMenuItem) {
        print(item.title)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

