//
//  UILabel.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

extension UILabel: QUIProtocol {
    
    func setContainText(str: String) {
        self.text = str
    }
    
    static func createQUI(frame: CGRect, viewModel: AnyObject) -> QUIProtocol {
        let rectRect:CGRect = CGRectMake(20, CGFloat(viewModel.objectForKey("top")!.intValue), frame.width - 40, 40)
        let ui = UILabel(frame: rectRect)
        ui.setContainText(viewModel.objectForKey("text") as! String)
        ui.textColor = ColorUtils.UIColorFromRGB(UInt(viewModel.objectForKey("color")!.intValue))
        return ui
    }
}
