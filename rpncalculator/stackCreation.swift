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
            self.stackContents.append(self.currentOperand)
            self.currentOperand = ""
        }
    }
    
    func display()->String{
        var displayMessage = ""
        for i in (0..<(stackContents.count)){
            displayMessage = displayMessage + stackContents[i] + " "
        }
        displayMessage = displayMessage + currentOperand
        return displayMessage
    }
    
    func deleteAll(){
        self.currentOperand = ""
        self.stackContents = []
    }
    
    func calcMasterCaller(){
        _ = calcMaster(newStackContents: self.stackContents)
    }
    
    func calcMaster(newStackContents:[String])->[String]{
        var localStackContents = newStackContents
        var aTimes = 0
        var bTimes = 0
        var result = 0
        while true{
            if localStackContents.count < 3{
                stackContents = localStackContents
                return(localStackContents)
            } else {
                var aText = localStackContents.removeFirst()
                if aText.contains("~"){
                    aTimes = -1
                    aText = aText.replacingOccurrences(of: "~", with: "")
                } else { aTimes = 1}
                guard var a = Int(aText)
                    else {return(localStackContents)}
                a = a *  aTimes
                
            
                var bText = localStackContents[0]
                if bText.contains("~"){
                    bTimes = -1
                    bText = bText.replacingOccurrences(of: "~", with: "")
                } else { bTimes = 1}
                guard var b = Int(bText)
                    else {return(localStackContents)}
                b=b*bTimes
                
                let cText = localStackContents[1]
                if cText == "+"{
                    result = a+b
                }
                else if cText == "-"{
                    result = a-b
                }
                else if cText == "*"{
                    result = a*b
                }
                else if cText == "/"{
                    result = a/b
                } else {localStackContents =  calcMaster(newStackContents: localStackContents)}
                var stringResult = String(result)
                stringResult = stringResult.replacingOccurrences(of: "-", with: "~")
                localStackContents.removeFirst()
                localStackContents.removeFirst()
                localStackContents.insert(stringResult, at: 0)
                
            }
        }
    return(localStackContents)
    }
        
}
