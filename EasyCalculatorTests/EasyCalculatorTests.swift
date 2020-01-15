//
//  EasyCalculatorTests.swift
//  EasyCalculatorTests
//
//  Created by Admin on 15.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import XCTest
@testable import EasyCalculator

class EasyCalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testInvertFunc() {
        let sut = ViewController() //system under test
        let currentInput = sut.currentInput
        
        sut.invertFunc()
        XCTAssert(currentInput == -currentInput, "currentInput value should be invert")
    }
    
    func testClearFunc() {
        let sut = ViewController()
        
        let firstOperand = sut.firstOperand
        let secondOperand = sut.secondOperand
        let currentInput = sut.currentInput
        let stillTyping = sut.stillTyping
        let dotIsPlace = sut.dotIsPlace
        let operationSign = sut.operationSign
        
        sut.clearFunc()
        XCTAssert(firstOperand == 0, "firstOperand value should be 0!")
        XCTAssert(secondOperand == 0, "secondOperand value should be 0!")
        XCTAssert(currentInput == 0, "currentInput value should be 0!")
        XCTAssert(stillTyping == false, "stillTyping value should be false")
        XCTAssert(dotIsPlace == false, "dotIsPlace value should be false")
        XCTAssert(operationSign == "", "operationSign value don't should be")


    }
    
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
