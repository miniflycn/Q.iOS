//
//  UIButton.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/1.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

extension UIButton: QUIProtocol {
    
    func innerText(text: String) {
        self.setTitle(text, forState: UIControlState.Normal)
    }
    
    static func createQUI(frame: CGRect, viewModel: AnyObject) -> QUIProtocol {
        let rectRect:CGRect = CGRectMake(20, CGFloat(viewModel.objectForKey("top")!.intValue), frame.width - 40, 40)
        let ui = UIButton(frame: rectRect)
        ui.innerText(viewModel.objectForKey("text") as! String)
        ui.backgroundColor = ColorUtils.UIColorFromRGB(UInt(viewModel.objectForKey("backgroundColor")!.intValue))
        return ui
    }
    
    // TODO too ugly to believe
    func delegateClick(sender: UIControl) {
        DirectiveManager.delegateClick(sender)
    }
}
