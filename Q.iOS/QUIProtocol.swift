//
//  QUIProtocol.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/1.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit
protocol QUIProtocol {
    // print a component to view
    static func createQUI(frame: CGRect, viewModel: AnyObject) -> QUIProtocol
    // something just like DOM API innerText
//    var innerText:String { get set }
    
    func innerText(text: String)
}
