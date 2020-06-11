//
//  Calculation.swift
//  rpncalculator
//
//  Created by Manners, William (Coll) on 11/06/2020.
//  Copyright © 2020 Manners, William (Coll). All rights reserved.
//

import Foundation

struct Calculation{
    func calcMaster(newStackContents:[String])->[String]{
        var localStackContents = newStackContents
        let operators = ["+","-","*","/"]
        var stallCounter = 0
        while true{
            
            let thisOp = localStackContents[0]
            stallCounter += 1
            if self.IShouldReturn(operators: operators, stackContents: localStackContents, stallCounter: stallCounter){
                return(localStackContents)
            }
                else if operators.contains(localStackContents[1]){
                let firstOfLocal = localStackContents[0]
                localStackContents =  self.calcMaster(newStackContents: Array(localStackContents[1...]))
                localStackContents.insert(firstOfLocal, at: 0)
                
            } else if operators.contains(localStackContents[2]){
                let firstOfLocal = localStackContents[0]
                let secondOfLocal = localStackContents[1]
                localStackContents = self.calcMaster(newStackContents: Array(localStackContents[2...]))
                localStackContents.insert(secondOfLocal, at: 0)
                localStackContents.insert(firstOfLocal, at: 0)
                
            } else {
                localStackContents.remove(at: 0)
                let stringResult = mathematicalOperations(thisOp: thisOp, stackContents: localStackContents)
                localStackContents.remove(at: 0)
                localStackContents.remove(at: 0)
                
                localStackContents.insert(stringResult, at: 0)
            
            }

        }
    }
    
    func mathematicalOperations(thisOp:String,stackContents:[String])->String{
        let b = stackContents[0]
        let a = stackContents[1]
        let intA = Int(a)
        let intB = Int(b)
        var result = 0
        
        if thisOp == "+"{
        result = intA!+intB!
        } else if thisOp == "-"{
        result = intA!-intB!
        } else if thisOp == "*"{
        result = intA!*intB!
        } else if thisOp == "/"{
        result = intA!/intB!
        }
        let stringResult = String(result)
        return stringResult
    }
    
    func IShouldReturn(operators: [String], stackContents: [String], stallCounter: Int)->Bool{
        if stackContents.count < 3 || !(stackContents[0].contains("+") || stackContents[0].contains("-") || stackContents[0].contains("*") || stackContents[0].contains("/")) || operators.contains(stackContents[stackContents.count - 1]) || stallCounter >= 50{
            return(true)
        }
        return(false)
        
    }
}
