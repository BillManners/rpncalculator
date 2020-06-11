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
    init(){
        stackContents = []
        currentOperand = ""
    }
    func appendThis(toAppend: String){
        if toAppend == "+" || toAppend == "-" || toAppend == "*" || toAppend == "/"{
            self.endOfOperand()
            currentOperand = toAppend
            self.endOfOperand()
        } else if toAppend == "~"{
            currentOperand = toAppend + currentOperand
        }else if currentOperand.count < 3 || (currentOperand.count < 4 && currentOperand.contains("~")){
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
        let lengthOfStackContents = stackContents.count
        for i in (0..<(stackContents.count)){
            displayMessage = displayMessage + stackContents[lengthOfStackContents-i-1] + " "
        }
        displayMessage = displayMessage + currentOperand
        return displayMessage
    }
    
    func deleteAll(){
        self.currentOperand = ""
        self.stackContents = []
    }
    
}
