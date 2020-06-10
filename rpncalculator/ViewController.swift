//
//  ViewController.swift
//  rpncalculator
//
//  Created by Manners, William (Coll) on 09/06/2020.
//  Copyright © 2020 Manners, William (Coll). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var zero: UIButton!
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var seven: UIButton!
    @IBOutlet var eight: UIButton!
    @IBOutlet var nine: UIButton!
    @IBOutlet var evaluate: UIButton!
    @IBOutlet var clear: UIButton!
    @IBOutlet var enter: UIButton!
    @IBOutlet var chs: UIButton!
    @IBOutlet var add: UIButton!
    @IBOutlet var subtract: UIButton!
    @IBOutlet var multiply: UIButton!
    @IBOutlet var divide: UIButton!
    
    @IBOutlet var calcDisplay: UILabel!
    var primaryStack = Stack()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func zeroPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "0")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func onePressed(_ sender: Any) {
        
        primaryStack.appendThis(toAppend: "1")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func twoPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "2")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func threePressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "3")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func fourPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "4")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func fivePressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "5")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func sixPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "6")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func sevenPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "7")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func eightPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "8")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func ninePressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "9")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func evaluatePressed(_ sender: Any) {
        primaryStack.endOfOperand()
        //Actual coding
    }
    @IBAction func clearPressed(_ sender: Any) {
        primaryStack.deleteAll()
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func enterPressed(_ sender: Any) {
        primaryStack.endOfOperand()
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func chsPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "~")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func addPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "+")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func subtractPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "-")
        calcDisplay.text = primaryStack.display()
    }
    
    @IBAction func multiplyPressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "*")
        calcDisplay.text = primaryStack.display()
    }
    @IBAction func dividePressed(_ sender: Any) {
        primaryStack.appendThis(toAppend: "/")
        calcDisplay.text = primaryStack.display()
    }
    
}

