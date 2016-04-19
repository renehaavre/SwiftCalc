//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Rene Haavre on 18/04/16.
//  Copyright © 2016 Skype. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var display: NSTextField!
    
    var userIsTyping = false

    @IBAction func appendDigit(sender: NSButton) {
        let digit = sender.title
        //print("digit = ", digit)
        
        if userIsTyping {
            display.stringValue = display.stringValue + digit
        }
        else {
            display.stringValue = digit
            userIsTyping = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter(sender: AnyObject) {
        userIsTyping = false
        operandStack.append(displayValue)
        print("operand stack = ", operandStack)
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.stringValue)!.doubleValue
        }
        set {
            display.stringValue = ("newValue")
            userIsTyping = false
        }
    }
}

