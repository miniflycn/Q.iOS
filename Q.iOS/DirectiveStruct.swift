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
    var name: DirectiveType
    // may not have arg
    var arg: String?
    // must have target
    var target: String
    // filters
    var filters: [FilterStruct]
    
    init(
        uiId: Int,
        name: String,
        target: String,
        arg: String?,
        filters: [AnyObject]
    ) {
        self.uiId = uiId
        self.name = .unknow
        self.target = target
        self.arg = arg
        self.filters = []
        // init name
        for i in 0...DirectiveType.list.count {
            if (DirectiveType.list[i].rawValue == name) {
                self.name = DirectiveType.list[i]
                break
            }
        }
        for (var i = 0, count = filters.count; i < count; i++) {
            let filter: AnyObject = filters[i]
            self.filters.append(
                FilterStruct(method: filter.objectForKey("method") as! String, args: filter.objectForKey("args") as! [AnyObject])
            )
        }
    }
}
