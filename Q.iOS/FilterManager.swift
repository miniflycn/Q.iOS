//
//  FilterManager.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/3.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import Foundation

class FilterManager {
    static func makeFilter(newVal: AnyObject, filters: [FilterStruct]) -> AnyObject {
        var result: AnyObject = newVal
        for (var i = 0, count = filters.count; i < count; i++) {
            let filter = filters[i]
            switch filter.method {
                case "append":
                    result = append(result, args: filter.args)
                    break
                case "prepend":
                    result = prepend(result, args: filter.args)
                    break
                default:
                    println("\(filter.method) is not exists")
            }
        }
        return result
    }
    
    // append string
    static private func append(val: AnyObject, args: [AnyObject]) -> AnyObject {
        if (args.count > 0) {
            if (val is String) {
                return ((val as! String) + (args[0] as! String)) as AnyObject
            } else {
                return ("\(val)" + (args[0] as! String)) as AnyObject
            }
        }
        assert(false, "must have argument in using append method")
    }
    
    // prepend string
    static private func prepend(val: AnyObject, args: [AnyObject]) -> AnyObject {
        if (args.count > 0) {
            if (val is String) {
                return ((args[0] as! String) + (val as! String)) as AnyObject
            } else {
                return ((args[0] as! String) + "\(val)") as AnyObject
            }
        }
        assert(false, "must have argument in using append method")
    }
}
