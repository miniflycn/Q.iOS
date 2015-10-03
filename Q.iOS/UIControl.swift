//
//  UIControl.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/4.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

extension UIControl {
    // what a fucking method
    func delegateClick(sender: UIControl) {
        DirectiveManager.delegateClick(sender)
    }
}