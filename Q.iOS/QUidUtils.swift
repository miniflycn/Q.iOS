//
//  QUidUtils.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/2.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

class QUidUtils {
    // uuid
    private static var _uuid: Int = 0
    private static var _olduuid: [Int] = []
    
    // get uuid
    static func uuid() -> Int {
        if (_olduuid.count > 0) {
            return _olduuid.removeAtIndex(0)
        } else {
            return ++self._uuid
        }
    }
    
    // restore uuid
    static func restore(id: Int) {
        _olduuid.append(id)
    }
}
