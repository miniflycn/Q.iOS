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
    // init DOM
    var dom: AnyObject? = nil
    
    // load file string from path
    private func loadFile(path: String) -> NSString {
        return NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
    }
    
    // load DOM from path
    private func loadDOM(path: String) {
        let data = loadFile(path).dataUsingEncoding(NSUTF8StringEncoding)!
        dom = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
    }
    
    // load logic script
    private func loadLogic(path: String) {
        ctx.evaluateScript(loadFile(path) as! String)
    }
    
    // print one component
    private func printComponent(str: String, options: AnyObject) {
        switch str {
            case "UIButton":
                return UIButton.print2View(self.view, viewModel: options)
            case "UILabel":
                return UILabel.print2View(self.view, viewModel: options)
            default:
                assert(false, "\(str) is not defined")
        }
    }
    
    // print all components which are defined in DOM
    private func printDOM() {
        var arr: [AnyObject] = dom!.objectForKey("childs") as! [AnyObject]
        let count = arr.count
        for (var i = 0; i < count; i++) {
            printComponent(arr[i].objectForKey("type") as! String, options: arr[i])
        }
    }
    
    // print reload btn & bind reload
    private func addReloadBtn() {
        let btn = UIButton(frame:CGRect(origin: CGPointMake(10.0, self.view.frame.height - 100.0), size: CGSizeMake(150,50)))
        btn.setTitle("Reload", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.blueColor()
        btn.addTarget(self, action: "reloadView:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    // clear view & reinit
    private func clearView() {
        self.view.subviews.map (
            { $0.removeFromSuperview() }
        )
        self.ctx = JSContext()
    }
    
    // reload view
    private func reloadView() {
        clearView()
        self.viewDidLoad()
    }
    
    // reload view from event
    func reloadView(sender: UIButton) {
        println("reload")
        reloadView()
    }
    
    // load all dynamic source
    func loadSource(path: String) {
        loadDOM("\(path)/view.json")
        loadLogic("\(path)/logic.js")
        printDOM()
        addReloadBtn()
    }
}
