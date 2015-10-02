//
//  FilterStruct.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/3.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

struct FilterStruct {
    var method: String
    var args: [AnyObject]
    
    init(
        method: String,
        args: [AnyObject]
    ) {
        self.method = method
        self.args = args
    }
}
