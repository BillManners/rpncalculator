//
//  stackCreation.swift
//  rpncalculator
//
//  Created by Manners, William (Coll) on 09/06/2020.
//  Copyright © 2020 Manners, William (Coll). All rights reserved.
//

import Foundation

class Stack{
    var stackContents: [String]
    var currentOperand: String
    let calculation = Calculation()
    init(){
        stackContents = []
        currentOperand = ""
    }
    func appendThis(toAppend: String){
        if toAppend == "+" || toAppend == "-" || toAppend == "*" || toAppend == "/"{
            self.endOfOperand()
            currentOperand = toAppend
            self.endOfOperand()
        } else if toAppend == "chs"{
            if currentOperand.contains("-"){
                currentOperand = currentOperand.replacingOccurrences(of: "-", with: "")
            } else {
            currentOperand = "-" + currentOperand
            }
        }else if currentOperand.count < 3 || (currentOperand.count < 4 && currentOperand.contains("-")){
            currentOperand = currentOperand + toAppend
        } else {
            self.endOfOperand()
        }
        
    }
    
    func endOfOperand(){
        if currentOperand.count != 0{
            self.stackContents.insert(self.currentOperand, at: 0)
            self.currentOperand = ""
        }
    }
    
    func display()->String{
        var displayMessage = ""
        let length = stackContents.count
        for i in (0..<(stackContents.count)){
            displayMessage = displayMessage + stackContents[length-i-1] + " "
        }
        displayMessage = displayMessage + currentOperand
        return displayMessage
    }
    
    func deleteAll(){
        self.currentOperand = ""
        self.stackContents = []
    }
    
    func calcMasterCaller(){
        self.stackContents = calculation.calcMaster(newStackContents: self.stackContents)
    }
    
}
