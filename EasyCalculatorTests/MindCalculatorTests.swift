//
//  MindCalculatorTests.swift
//  MindCalculatorTests
//
//  Created by Admin on 15.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import XCTest
@testable import EasyCalculator

class MindCalculatorTests: XCTestCase {
    
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
    
    func testEqualFuncSecondEqualOperand() {
        // 1. given
        sut.stillTyping = true
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssertEqual(sut.secondOperand, sut.currentInput)
        XCTAssertTrue(!sut.dotIsPlace, "dotIsPlace value should be equal false")
    }
    
    func testEqualFuncSum() {
        
        // 1. given
        sut.stillTyping = false
        sut.firstOperand = 50
        sut.secondOperand = 50
        sut.operationSign = "+"
        
        // 2. when
        print(sut.currentInput)
        sut.equalFunc()
        print(sut.currentInput)
        
        // 3. then
        XCTAssertEqual(sut.currentInput, 100)
    }
    
    func testEqualFuncMinus() {
        
        // 1. given
        sut.firstOperand = 50
        sut.secondOperand = 50
        sut.operationSign = "-"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssertEqual(sut.currentInput, 0)
    }
    
    func testEqualFuncMultiply() {
        
        // 1. given
        sut.firstOperand = 5
        sut.secondOperand = 5
        sut.operationSign = "×"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssertEqual(sut.currentInput, 25)
    }
    
    func testEqualFuncDivide() {
        
        // 1. given
        sut.firstOperand = 5
        sut.secondOperand = 5
        sut.operationSign = "÷"
        
        // 2. when
        sut.equalFunc()
        
        // 3. then
        XCTAssertEqual(sut.currentInput, 1)
        
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
    
    func testPressedNumber() {
        // 1. given
        sut.stillTyping = false
        let number = "9919919919"
        
        // 2. when
        sut.getPressedNumber(number)
        
        // 3. then
        XCTAssertEqual(sut.labelResultDisplay.text!, "9919919919")
    }
    
    func testPressedNumberCharactersLessLimit() {
        // 1. given
        sut.stillTyping = true
        sut.labelResultDisplay.text = "111"
        let number = "222"
        
        // 2. when
        sut.getPressedNumber(number)
        
        // 3. then
        XCTAssertEqual(sut.labelResultDisplay.text!, "111222")
    }
    
    func testSaveUserDefaultsData() {
        // 1. given
        sut.currentInput = 20
        sut.saveUserDefaultsData()
        
        // 2. when
        sut.saveUserDefaultsData()
        
        // 3. then
        XCTAssertEqual(UserDefaults.standard.isCurrentInput(), 20)
    }
    
}
