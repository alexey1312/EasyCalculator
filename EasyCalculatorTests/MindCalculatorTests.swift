//
//  MindCalculatorTests.swift
//  MindCalculatorTests
//
//  Created by Admin on 15.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import XCTest
@testable import EasyCalculator

class EasyCalculatorTests: XCTestCase {
    
    var sut: MindCalculator!
    
    override func setUp() {
        super.setUp()
        let labelResultDisplayText = UILabel()
        sut = MindCalculator(labelResultDisplayText: labelResultDisplayText) //system under test
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testClearFunc() {
        // 1. given
        sut.firstOperand = 1.0
        sut.secondOperand = 1.0
        sut.currentInput = 1.0
        sut.stillTyping = true
        sut.dotIsPlace = true
        sut.operationSign = "/"
        
        // 2. when
        sut.clearFunc()
        
        // 3. then
        XCTAssert(sut.firstOperand == 0, "firstOperand value should be 0!")
        XCTAssert(sut.secondOperand == 0, "secondOperand value should be 0!")
        XCTAssert(sut.currentInput == 0, "currentInput value should be 0!")
        XCTAssert(sut.stillTyping == false, "stillTyping value should be false")
        XCTAssert(sut.dotIsPlace == false, "dotIsPlace value should be false")
        XCTAssert(sut.operationSign == "", "operationSign value don't should be")
    }
    
    func testInvertFunc() {
        // 1. given
        sut.currentInput = 5
        
        // 2. when
        sut.invertFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == -5, "currentInput value should be invert")
    }
    
    func testPercentFunc() {
        // 1. given
        sut.firstOperand = 0
        
        // 2. when
        sut.percentFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == sut.currentInput / 100, "currentInput value should be invert")
        
        // 1. given
        sut.firstOperand = 5
        sut.secondOperand = 5
        
        // 2. when
        sut.percentFunc()
        
        // 3. then
        XCTAssert(sut.secondOperand == sut.firstOperand * sut.currentInput / 100, "secondOperand value should be %")
    }
    
    func testSquareRootFunc() {
        // 1. given
        sut.currentInput = 9
        
        // 2. when
        sut.squareRootFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == 3, "currentInput value should be square root")
        
        // 1. given
        sut.currentInput = -9
        
        // 2. when
        sut.squareRootFunc()
        
        // 3. then
        XCTAssertEqual(sut.labelResultDisplay.text, "Error")
        XCTAssertTrue(!sut.stillTyping, "stillTyping value should be equal false")
    }
    
    func testAddDot() {
        // 1. given
        sut.stillTyping = true
        sut.dotIsPlace = false
        sut.labelResultDisplay.text = "123"
        
        // 2. when
        sut.addDotFunc()
        
        // 3. then
        XCTAssertEqual(sut.labelResultDisplay.text, "123.")
        
        // 1. given
        sut.stillTyping = false
        sut.dotIsPlace = false
        sut.labelResultDisplay.text = "0"
        
        // 2. when
        sut.addDotFunc()
        
        // 3. then
        XCTAssertEqual(sut.labelResultDisplay.text, "0.")
    }
    
    func testEqualFunc() {
        // 1. given
        sut.stillTyping = true
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssertEqual(sut.secondOperand, sut.currentInput)
        XCTAssertTrue(!sut.dotIsPlace, "dotIsPlace value should be equal false")
        
        // 1. given
        sut.firstOperand = 50
        sut.secondOperand = 50
        sut.operationSign = "+"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == 100, "currentInput value should be equal 100")
        
        // 1. given
        sut.firstOperand = 50
        sut.secondOperand = 50
        sut.operationSign = "-"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == 0, "currentInput value should be equal 0")
        
        // 1. given
        sut.firstOperand = 5
        sut.secondOperand = 5
        sut.operationSign = "×"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == 25, "currentInput value should be equal 25")
        
        // 1. given
        sut.firstOperand = 5
        sut.secondOperand = 5
        sut.operationSign = "÷"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssert(sut.currentInput == 1, "currentInput value should be equal 1")
        
        // 1. given
        sut.firstOperand = 5
        sut.secondOperand = 0
        sut.operationSign = "÷"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssertEqual(sut.labelResultDisplay.text, "Error")
    }
    
    func testGetPressedOperataion() {
        // 1. given
        sut.stillTyping = true
        sut.dotIsPlace = true
        sut.firstOperand = 100
        
        // 2. when
        sut.getPressedOperataion()
        
        // 3. then
        XCTAssertEqual(sut.firstOperand, sut.currentInput)
        XCTAssertTrue(!sut.stillTyping, "stillTyping value should be equal false")
        XCTAssertTrue(!sut.dotIsPlace, "dotIsPlace value should be equal false")
    }
    
    func testGetPressedNumber() {
        // 1. given
        sut.stillTyping = true
        
        // 2. when
        sut.getPressedNumber("999999999999999999999999999999999999")
        
        // 3. then
        XCTAssertTrue(sut.stillTyping, "stillTyping value should be equal true")
        XCTAssertEqual(sut.labelResultDisplay.text, "9999999999999999999")
    }
    
    //
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
