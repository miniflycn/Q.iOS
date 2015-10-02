//
//  DirectiveStruct.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

struct DirectiveStruct {
    // which UI bind
    var uiId: Int
    // directive name
    var name: String
    // may not have arg
    var arg: String?
    // must have target
    var target: String
    
    init(
        uiId: Int,
        name: String,
        target: String,
        arg: String?
    ) {
        self.uiId = uiId
        self.name = name
        self.target = target
        self.arg = arg
    }
}
