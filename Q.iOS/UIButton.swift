//
//  UIButton.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/1.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

extension UIButton: QUIProtocol {
    func setContainText(text: String) {
        self.setTitle(text, forState: UIControlState.Normal)
    }
    
    func setContainTextColor(color: Int32) {
        // TODO
    }
    
    static func createQUI(frame: CGRect, viewModel: AnyObject) -> QUIProtocol {
        let rectRect:CGRect = CGRectMake(20, CGFloat(viewModel.objectForKey("top")!.intValue), frame.width - 40, 40)
        let ui = UIButton(frame: rectRect)
        return ui
    }
}
