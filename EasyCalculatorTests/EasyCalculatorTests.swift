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
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = ViewController() //system under test
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testClearFunc() {
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

    func testInvertFunc() {
        let currentInput = sut.currentInput
        
        sut.invertFunc()
        XCTAssert(currentInput == -currentInput, "currentInput value should be invert")
    }

    func testPercentFunc() {
        var firstOperand = sut.firstOperand
        let secondOperand = sut.secondOperand
        let currentInput = sut.currentInput

        firstOperand = 0
        sut.percentFunc()
        XCTAssert(currentInput == currentInput/100, "currentInput value should be invert")

        firstOperand = 5
        XCTAssert(secondOperand == firstOperand * currentInput / 100, "secondOperand value should be %")
    }

    func testSquareRootFunc() {
        let currentInput = sut.currentInput

        sut.squareRootFunc()

        XCTAssert(currentInput == sqrt(currentInput), "currentInput value should be square root")
    }
    
    func testAddDot() {
        let labelResultDisplay = sut.labelResultDisplay?.text
        var currentInput = sut.currentInput
        let dotIsPlace = sut.dotIsPlace
        
        currentInput = 0
        sut.addDotFunc()

        XCTAssert(dotIsPlace != true, "dotIsPlace value should be true")
        XCTAssert(labelResultDisplay != labelResultDisplay ?? "0" + ".", "labelResultDisplay value should be add .")
//
//        dotIsPlace = false
//        stillTyping = false
//        sut.addDotFunc()
//        XCTAssert(labelResultDisplay == ".0", "labelResultDisplay value should be .0")
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
