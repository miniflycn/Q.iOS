//
//  DirectiveType.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/7.
//  Copyright © 2015年 miniflycn. All rights reserved.
//

enum DirectiveType: String {
    static let list: [DirectiveType] = [
        .text,
        .on
    ]
    case text = "text"
    case on = "on"
    case unknow
}