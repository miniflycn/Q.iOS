//
//  UIButton.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/1.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

extension UIButton: QComponentProtocol {
    
    static func print2View(view: UIView, viewModel: AnyObject) {
        let rectRect:CGRect = CGRectMake(20, CGFloat(viewModel.objectForKey("top")!.intValue), view.frame.width - 40, 40)
        let btn = UIButton(frame: rectRect)
        let directives: [AnyObject] = viewModel.objectForKey("directives") as! [AnyObject]
        btn.setTitle(viewModel.objectForKey("text") as? String, forState: UIControlState.Normal)
        btn.backgroundColor = ColorUtils.UIColorFromRGB(UInt(viewModel.objectForKey("backgroundColor")!.intValue))
        view.addSubview(btn)
    }
}
