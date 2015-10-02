//
//  QUIInstanceManager.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit

class QUIInstanceManager {
    static var QUIInstanceStore = Dictionary<Int, QUIProtocol>()
    static var QUIViewModelStore = Dictionary<Int, AnyObject>()

    // attach every UIView
    static func attach(qui: QUIProtocol, viewModel: AnyObject) {
        let ui = qui as! UIView
        // hasn't attach before
        if (ui.tag == 0) {
            let uuid = QUidUtils.uuid()
            // attach uuid
            ui.tag = uuid
            // store
            QUIInstanceStore[uuid] = qui
            QUIViewModelStore[uuid] = viewModel
        }
    }
    
    // detach UIView
    static func detach(qui: QUIProtocol) {
        let ui = qui as! UIView
        if (ui.tag != 0) {
            let uuid = ui.tag
            detach(uuid)
        }
    }
    
    static func detach(uuid: Int) {
        QUidUtils.restore(uuid)
        QUIViewModelStore.removeValueForKey(uuid)
        let ui = QUIInstanceStore.removeValueForKey(uuid) as! UIView
        ui.tag = 0
    }
    
    static func getDirective(uuid: Int, directiveName: String) -> AnyObject? {
        let viewModel: AnyObject? = QUIViewModelStore[uuid]
        if (viewModel != nil) {
            let directives: [AnyObject] = viewModel!.objectForKey("directives") as! [AnyObject]
            for (var i = 0, count = directives.count; i < count; i++) {
                if ((directives[i] as AnyObject).objectForKey("name") as! String == directiveName) {
                    return directives[i]
                }
            }
        }
        return nil
    }
    
    static func get(uuid: Int) -> QUIProtocol? {
        return QUIInstanceStore[uuid]
    }
}
