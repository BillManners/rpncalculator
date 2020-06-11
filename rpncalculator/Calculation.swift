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
        var result = 0
        while true{
            let thisOp = localStackContents[0]
            if localStackContents.count < 3 || !(localStackContents[0].contains("+") || localStackContents[0].contains("-") || localStackContents[0].contains("*") || localStackContents[0].contains("/")) {
                return(localStackContents)
                
            } else if operators.contains(localStackContents[1]){
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
                if thisOp == "+"{
                    let b = localStackContents.remove(at: 0)
                    let a = localStackContents.remove(at: 0)
                    let intA = Int(a)
                    let intB = Int(b)
                    result = intA!+intB!
                    
                }
                else if thisOp == "-"{
                    let b = localStackContents.remove(at: 0)
                    let a = localStackContents.remove(at: 0)
                    let intA = Int(a)
                    let intB = Int(b)
                    result = intA!-intB!
                }
                else if thisOp == "*"{
                    let b = localStackContents.remove(at: 0)
                    let a = localStackContents.remove(at: 0)
                    let intA = Int(a)
                    let intB = Int(b)
                    result = intA!*intB!
                }
                else if thisOp == "/"{
                    let b = localStackContents.remove(at: 0)
                    let a = localStackContents.remove(at: 0)
                    let intA = Int(a)
                    let intB = Int(b)
                    result = intA!/intB!
                }
                let stringResult = String(result)
                localStackContents.insert(stringResult, at: 0)
            
            }

        }
    }
}
