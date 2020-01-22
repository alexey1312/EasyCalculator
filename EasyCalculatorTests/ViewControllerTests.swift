//
//  ViewControllerTests.swift
//  EasyCalculatorTests
//
//  Created by Admin on 22.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import XCTest
@testable import EasyCalculator

class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(withIdentifier: "mainViewController") as! ViewController)
        
        sut.loadView()
        sut.viewDidLoad()
        sut.mindCalculator.loadUserDefaultsData()
    }
    
    override func tearDown() {
        sut.viewWillDisappear(true)
        sut.mindCalculator.saveUserDefaultsData()
        sut = nil
        
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfLabel() {
        XCTAssertNotNil(sut.labelResultDisplay, "ViewController under test is not composed of a UILabel")
    }
    
    func testViewControllerIsComposedOfNumberButtons() {
        XCTAssertNotNil(sut.buttonsNum0,
                        "ViewController under test is not composed of a buttonsNum0")
        XCTAssertNotNil(sut.buttonsNum1,
                        "ViewController under test is not composed of a buttonsNum1")
        XCTAssertNotNil(sut.buttonsNum2,
                        "ViewController under test is not composed of a buttonsNum2")
        XCTAssertNotNil(sut.buttonsNum3,
                        "ViewController under test is not composed of a buttonsNum3")
        XCTAssertNotNil(sut.buttonsNum4,
                        "ViewController under test is not composed of a buttonsNum4")
        XCTAssertNotNil(sut.buttonsNum5,
                        "ViewController under test is not composed of a buttonsNum5")
        XCTAssertNotNil(sut.buttonsNum6,
                        "ViewController under test is not composed of a buttonsNum6")
        XCTAssertNotNil(sut.buttonsNum7,
                        "ViewController under test is not composed of a buttonsNum7")
        XCTAssertNotNil(sut.buttonsNum8,
                        "ViewController under test is not composed of a buttonsNum8")
        XCTAssertNotNil(sut.buttonsNum9,
                        "ViewController under test is not composed of a buttonsNum9")
    }
    
    func testViewControllerIsComposedOfOperataionButtons() {
        XCTAssertNotNil(sut.buttonOperataionC,
                        "ViewController under test is not composed of a buttonsOperataionC")
        XCTAssertNotNil(sut.buttonOperataionDot,
                        "ViewController under test is not composed of a buttonsOperataionDot")
        XCTAssertNotNil(sut.buttonOperataionSum,
                        "ViewController under test is not composed of a buttonsOperataionSum")
        XCTAssertNotNil(sut.buttonOperataionEqual,
                        "ViewController under test is not composed of a buttonsOperataionEqual")
        XCTAssertNotNil(sut.buttonOperataionMinus,
                        "ViewController under test is not composed of a buttonsOperataionMinus")
        XCTAssertNotNil(sut.buttonOperataionDivide,
                        "ViewController under test is not composed of a buttonsOperataionDivide")
        XCTAssertNotNil(sut.buttonOperataionPercent,
                        "ViewController under test is not composed of a buttonsOperataionPercent")
        XCTAssertNotNil(sut.buttonOperataionMultiply,
                        "ViewController under test is not composed of a buttonsOperataionMultiply")
        XCTAssertNotNil(sut.buttonOperataionPlusMinus,
                        "ViewController under test is not composed of a buttonsOperataionPlusMinus")
        XCTAssertNotNil(sut.buttonOperataionSquareRoot,
                        "ViewController under test is not composed of a buttonsOperataionSquareRoot")
    }
    
    func testLabelAfterButtonTapClear() {
        // 1. given
        let expectedLabelText = "0"
        sut.labelResultDisplay.text = "111"
        // 2. when
        sut.buttonClearPressed(sut.buttonOperataionC)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
    func testLabelAfterButtonTapNumber() {
        // 1. given
        var expectedLabelText = "1234567890"
        sut.labelResultDisplay.text = "111"
        // 2. when
        sut.buttonNumberPressed(sut.buttonsNum1)
        sut.buttonNumberPressed(sut.buttonsNum2)
        sut.buttonNumberPressed(sut.buttonsNum3)
        sut.buttonNumberPressed(sut.buttonsNum4)
        sut.buttonNumberPressed(sut.buttonsNum5)
        sut.buttonNumberPressed(sut.buttonsNum6)
        sut.buttonNumberPressed(sut.buttonsNum7)
        sut.buttonNumberPressed(sut.buttonsNum8)
        sut.buttonNumberPressed(sut.buttonsNum9)
        sut.buttonNumberPressed(sut.buttonsNum0)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
        // 1. given
        expectedLabelText = "12345678901"
        // 2. when
        sut.buttonNumberPressed(sut.buttonsNum1)
        // 3. then
        XCTAssert(sut.labelResultDisplay.text!.count <= 10, "number of characters no more than 10")
    }
    
    func testLabelAfterButtonTapOperataion() {
        // 1. given
        let expectedLabelText = "5"
        sut.labelResultDisplay.text = "10"
        // 2. when
        sut.buttonOperataionPressed(sut.buttonOperataionMinus)
        sut.buttonOperataionPressed(sut.buttonOperataionMinus)
        sut.buttonNumberPressed(sut.buttonsNum5)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
    func testLabelAfterButtonTapEquality() {
        // 1. given
        let expectedLabelText = "5"
        sut.labelResultDisplay.text = "5"
        // 2. when
        sut.buttonEqualityPressed(sut.buttonOperataionEqual)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
    func testLabelAfterButtonTapPlusMinus() {
        // 1. given
        let expectedLabelText = "-9"
        sut.labelResultDisplay.text = "9"
        // 2. when
        sut.buttonPlusMinusPressed(sut.buttonOperataionPlusMinus)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
    func testLabelAfterButtonTapPercent() {
        // 1. given
        let expectedLabelText = "0.09"
        sut.labelResultDisplay.text = "9"
        // 2. when
        sut.buttonPercentPressed(sut.buttonOperataionPercent)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
    func testLabelAfterButtonTapSquareRoot() {
        // 1. given
        let expectedLabelText = "3"
        sut.labelResultDisplay.text = "9"
        // 2. when
        sut.buttonSquareRootPressed(sut.buttonOperataionSquareRoot)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
    func testLabelAfterButtonTapDot() {
        // 1. given
        let expectedLabelText = "0."
        sut.labelResultDisplay.text = "0"
        // 2. when
        sut.buttonDotPressed(sut.buttonOperataionDot)
        // 3. then
        XCTAssertEqual(expectedLabelText, sut.labelResultDisplay.text)
    }
    
}
