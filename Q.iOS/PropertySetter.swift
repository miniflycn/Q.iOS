//
//  PropertySetter.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/6.
//  Copyright © 2015年 miniflycn. All rights reserved.
//
import UIKit

class PropertySetter {
    // cache a qui in
    var qui:QUIProtocol?
    
    init(qui: QUIProtocol) {
        self.qui = qui
    }
    
    deinit {
        self.qui = nil
    }
    
    func backgroundColor() -> ((AnyObject) -> Void) {
        return {
            (self.qui as! UIView).backgroundColor = ColorUtils.UIColorFromRGB($0.intValue)
        }
    }
    
    func text() -> ((AnyObject) -> Void) {
        return {
            self.qui!.setContainText("\($0)")
        }
    }
    
    func color() -> ((AnyObject) -> Void) {
        return {
            self.qui!.setContainTextColor($0.intValue)
        }
    }
}