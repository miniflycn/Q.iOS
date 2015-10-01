//
//  QViewController.swift
//  Q.iOS
//
//  Created by 杨 文坚 on 15/10/1.
//  Copyright (c) 2015年 miniflycn. All rights reserved.
//

import UIKit
import JavaScriptCore

class QViewController: UIViewController {
    
    // init ctx
    var ctx = JSContext()
    var dom: AnyObject? = nil
    
    private func loadFile(path: String) -> NSString {
        return NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
    }
    
    private func loadDOM(path: String) {
        let data = loadFile(path).dataUsingEncoding(NSUTF8StringEncoding)!
        dom = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
    }
    
    private func loadLogic(path: String) {
        ctx.evaluateScript(loadFile(path) as! String)
    }
    
    private func printComponent(str: String, options: AnyObject) {
        switch str {
            case "UIButton":
                return UIButton.print2View(self.view, viewModel: options)
            default:
                assert(false, "\(str) is not defined")
        }
    }
    
    private func printDOM() {
        var arr: [AnyObject] = dom!.objectForKey("childs") as! [AnyObject]
        let count = arr.count
        for (var i = 0; i < count; i++) {
            printComponent(arr[i].objectForKey("type") as! String, options: arr[i])
        }
    }
    
    
    func loadSource(path: String) {
        loadDOM("\(path)/view.json")
        loadLogic("\(path)/logic.js")
        printDOM()
    }
}
