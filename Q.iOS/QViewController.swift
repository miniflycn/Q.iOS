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
    
    private func addReloadBtn() {
        let btn = UIButton(frame:CGRect(origin: CGPointMake(10.0, self.view.frame.height - 100.0), size: CGSizeMake(150,50)))
        btn.setTitle("Reload", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.blueColor()
        btn.addTarget(self, action: "reloadView:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    private func clearView() {
        self.view.subviews.map (
            { $0.removeFromSuperview() }
        )
        self.ctx = JSContext()
    }
    
    private func reloadView() {
        clearView()
        self.viewDidLoad()
    }
    
    func reloadView(sender: UIButton) {
        println("reload")
        reloadView()
    }
    
    
    func loadSource(path: String) {
        loadDOM("\(path)/view.json")
        loadLogic("\(path)/logic.js")
        printDOM()
        addReloadBtn()
    }
}
