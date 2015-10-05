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
    
    func setContainTextColor(color: Int32) {
        self.textColor = ColorUtils.UIColorFromRGB(color)
    }
    
    static func createQUI(frame: CGRect, viewModel: AnyObject) -> QUIProtocol {
        let rectRect:CGRect = CGRectMake(20, CGFloat(viewModel.objectForKey("top")!.intValue), frame.width - 40, 40)
        let ui = UILabel(frame: rectRect)
        return ui
    }
}
