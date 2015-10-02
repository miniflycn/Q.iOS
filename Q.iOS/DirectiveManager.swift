//
//  DirectiveManager.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

class directiveManager {
    static func bind(component: QUIProtocol, directives: [AnyObject]) {
        for (var i = 0, count = directives.count; i < count; i++) {
            bindOneDirective(component, directive: directives[i])
        }
    }
    
    private static func bindOneDirective(component: QUIProtocol, directive: AnyObject) {
        let directiveName = directive.objectForKey("name") as! String
        switch directiveName {
            case "on":
                component.bindOnDirective(directive)
                break
            default:
                println("No define \(directiveName) direcdtive")
        }
    }
}
