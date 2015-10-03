//
//  DirectiveHandleManager.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//
import UIKit

class DirectiveHandleManager: NSObject {
    // property -> directive
    var directiveStructPool = Dictionary<String, [DirectiveStruct]>()
    
    // when property change trigger
    func on(prop: String, directive: DirectiveStruct) {
        if (directiveStructPool[prop] != nil) {
            directiveStructPool[prop]!.append(directive)
        } else {
            directiveStructPool[prop] = [directive]
        }
    }
    
    // emit a property change
    func emit(prop: String, value: AnyObject) {
        if (directiveStructPool[prop] != nil) {
            let directives = directiveStructPool[prop]
            for (var i = 0, count = directives!.count; i < count; i++) {
                self.handle(directives![i], value: value)
            }
        }
    }
    
    // handle all property -> directive
    func handle(directive: DirectiveStruct, value: AnyObject) {
        var newVal: AnyObject? = nil
        if (directive.filters.count > 0) {
            newVal = FilterManager.makeFilter(value, filters: directive.filters)
        } else {
            newVal = value
        }
        
        switch directive.name {
            case "text":
                self.handleText(directive, value: newVal!)
                break
            default:
                print("Couldn't handle \(directive.name)")
        }
    }
    
    // handle property -> text
    func handleText(directive: DirectiveStruct, value: AnyObject) {
        let qui = QUIInstanceManager.get(directive.uiId)
        qui!.setContainText("\(value)")
    }
}
