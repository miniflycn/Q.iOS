//
//  UILabel.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

extension UILabel: QComponentProtocol {
    
    static func print2View(view: UIView, viewModel: AnyObject) {
        let rectRect:CGRect = CGRectMake(20, CGFloat(viewModel.objectForKey("top")!.intValue), view.frame.width - 40, 80)
        let label:UILabel = UILabel(frame: rectRect)
        let directives: [AnyObject] = viewModel.objectForKey("directives") as! [AnyObject]
        label.text = viewModel.objectForKey("text") as? String
        label.textColor = ColorUtils.UIColorFromRGB(UInt(viewModel.objectForKey("color")!.intValue))
        view.addSubview(label)
    }
}
