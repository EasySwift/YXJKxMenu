# YXJKxMenu
微信，qq首页右上角的菜单效果，即将到来


        private func showMenu() {
                var menuArray: [YXJKxMenuItem] = []

                for item in WorkTypeArr {
                    let menuItem = YXJKxMenuItem(item.name, image: nil, target: self, action: #selector(PublicVC.choiceTypeResult(_:)))
                    menuArray.append(menuItem)
                }

                let fount = UIFont.systemFontOfSize(14)
                YXJKxMenu.setTitleFont(fount)
                let fontColor: Color = Color(R: 82 / 255.0, G: 82 / 255.0, B: 82 / 255.0)
                let backColor: Color = Color(R: 1, G: 1, B: 1)
                let option = OptionalConfiguration(
                    arrowSize: 0,
                    marginXSpacing: 10,
                    marginYSpacing: 10,
                    intervalSpacing: 30,
                    menuCornerRadius: 0,
                    maskToBackground: true,
                    shadowOfMenu: true,
                    hasSeperatorLine: true,
                    seperatorLineHasInsets: false,
                    textColor: fontColor,
                    menuBackgroundColor: backColor,
                    setWidth: (SCREENWIDTH() - 15 * 2) / 2)
        
                // 显示位置
                let widonw = UIApplication.sharedApplication().delegate!.window
        
                let rect = CGRectMake(70, ScreenHeight / 2 - 50, 115, 30)
        
                YXJKxMenu.showMenuInView(widonw!,
                    fromRect: rect,
                    menuItems: menuArray,
                    withOptions: option)
    }
