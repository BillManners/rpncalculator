//
//  rpncalculatorTests.swift
//  rpncalculatorTests
//
//  Created by Manners, William (Coll) on 09/06/2020.
//  Copyright © 2020 Manners, William (Coll). All rights reserved.
//

import XCTest
@testable import rpncalculator

class rpncalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testsimpleAddition() {
        //arrange
        let calculation = Calculation()
        let expectedResult = ["10"]
        //act
        let result = calculation.calcMaster(newStackContents: ["+","4","6"])
        //assert
        XCTAssertEqual(expectedResult, result)
    }
    
    func testlongAddition() {
        //arrange
        let calculation = Calculation()
        let expectedResult = ["23"]
        //act
        let result = calculation.calcMaster(newStackContents: ["+","+","+","3","10","4","6"])
        //assert
        XCTAssertEqual(expectedResult, result)
    }
    
    func testallOperations() {
        //arrange
        let calculation = Calculation()
        let expectedResult = ["205"]
        //act
        let result = calculation.calcMaster(newStackContents: ["+","-","4","6","*","7","/","3","87"])
        //assert
        XCTAssertEqual(expectedResult, result)
    }
    
    func testwithNegs() {
        //arrange
        let calculation = Calculation()
        let expectedResult = ["-201"]
        //act
        let result = calculation.calcMaster(newStackContents: ["+","-","4","6","*","7","/","3","-87"])
        //assert
        XCTAssertEqual(expectedResult, result)
    }
    
    func testfailure() {
        //arrange
        let calculation = Calculation()
        let expectedResult = ["+","-4"]
        //act
        let result = calculation.calcMaster(newStackContents: ["+","-","7","3"])
        //assert
        XCTAssertEqual(expectedResult, result)
    }
    


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
