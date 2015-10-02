//
//  QComponentProtocol.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/1.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit
protocol QUIProtocol {
    // print a component to view
    static func print2View(view: UIView, viewModel: AnyObject)
    // bind on directive
    func bindOnDirective(directive: AnyObject)
}
