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

    @IBAction func operate(sender: AnyObject) {
        
        let operation = sender.title!
        print(sender.title!)
        if userIsTyping{
            sendEnter()
        }
        
        switch operation {
        case "⨉":
            performOperation() { $0 * $1 }
        case "÷":
            performOperation() { $1 * $0 }
        case "+":
            performOperation() { $0 + $1 }
        case "-":
            performOperation() { $1 - $0 }
        default:
            break
        }
        
    }
    
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
        sendEnter()
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.stringValue)!.doubleValue
        }
        set {
            display.stringValue =  "\(newValue)"
            userIsTyping = false
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
        }
    }
    
    func sendEnter() {
        userIsTyping = false
        operandStack.append(displayValue)
        print("operand stack = ", operandStack)
    }
}

