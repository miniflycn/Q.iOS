//
//  DirectiveManager.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

class DirectiveManager: DirectiveHandleManager {
    
    func bind(qui: QUIProtocol, directives: [AnyObject]) {
        let uuid = (qui as! UIView).tag
        for (var i = 0, count = directives.count; i < count; i++) {
            let tmp: AnyObject = directives[i]
            let directive = DirectiveStruct(
                uiId: uuid,
                name: tmp.objectForKey("name") as! String,
                target: tmp.objectForKey("target") as! String,
                arg: tmp.objectForKey("arg") as? String,
                filters: tmp.objectForKey("filters") as! [AnyObject]
            )
            bindOneDirective(qui, directive: directive)
        }
    }
    
    private func bindOneDirective(ui: QUIProtocol, directive: DirectiveStruct) {
        let directiveName = directive.name
        switch directiveName {
            case "on":
                bindOn(ui, directive: directive)
                break
            case "text":
                bindNormal(ui, directive: directive)
                break
            default:
                print("No define \(directiveName) direcdtive")
        }
    }
    
    private func bindOn(qui: QUIProtocol, directive: DirectiveStruct) {
        // if is a UIControl
        if (qui is UIControl) {
            let ui = qui as! UIControl
            ui.addTarget(ui, action: "delegateClick:", forControlEvents: UIControlEvents.TouchUpInside)
        } else {
            print("\(qui) is not a UIControl instance")
        }
    }
    
    private func bindNormal(ui: QUIProtocol, directive: DirectiveStruct) {
        self.on(directive.target, directive: directive)
    }
    
    static func delegateClick(sender: UIControl) {
        let uuid = sender.tag
        let directive: AnyObject? = QUIInstanceManager.getDirective(uuid, directiveName: "on")
        // has directive
        if (directive != nil) {
            NSNotificationCenter.defaultCenter().postNotificationName("evalJavascriptNotification", object: self, userInfo: ["target": directive?.objectForKey("target") as! String])
        }
    }
}
