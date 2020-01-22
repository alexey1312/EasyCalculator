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
        self.sut = (storyboard.instantiateViewController(withIdentifier: "mainViewController") as! ViewController)
        
        self.sut.loadView()
        self.sut.viewDidLoad()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfLabel() {
        XCTAssertNotNil(self.sut.labelResultDisplay, "ViewController under test is not composed of a UILabel")
    }
    
    func testViewControllerIsComposedOfNumberButtons() {
        XCTAssertNotNil(self.sut.buttonsNum0, "ViewController under test is not composed of a buttonsNum0")
        XCTAssertNotNil(self.sut.buttonsNum1, "ViewController under test is not composed of a buttonsNum1")
        XCTAssertNotNil(self.sut.buttonsNum2, "ViewController under test is not composed of a buttonsNum2")
        XCTAssertNotNil(self.sut.buttonsNum3, "ViewController under test is not composed of a buttonsNum3")
        XCTAssertNotNil(self.sut.buttonsNum4, "ViewController under test is not composed of a buttonsNum4")
        XCTAssertNotNil(self.sut.buttonsNum5, "ViewController under test is not composed of a buttonsNum5")
        XCTAssertNotNil(self.sut.buttonsNum6, "ViewController under test is not composed of a buttonsNum6")
        XCTAssertNotNil(self.sut.buttonsNum7, "ViewController under test is not composed of a buttonsNum7")
        XCTAssertNotNil(self.sut.buttonsNum8, "ViewController under test is not composed of a buttonsNum8")
        XCTAssertNotNil(self.sut.buttonsNum9, "ViewController under test is not composed of a buttonsNum9")
    }
    
    func testViewControllerIsComposedOfOperataionButtons() {
        XCTAssertNotNil(self.sut.buttonsOperataionC, "ViewController under test is not composed of a buttonsOperataionC")
        XCTAssertNotNil(self.sut.buttonsOperataionDot, "ViewController under test is not composed of a buttonsOperataionDot")
        XCTAssertNotNil(self.sut.buttonsOperataionSum, "ViewController under test is not composed of a buttonsOperataionSum")
        XCTAssertNotNil(self.sut.buttonsOperataionEqual, "ViewController under test is not composed of a buttonsOperataionEqual")
        XCTAssertNotNil(self.sut.buttonsOperataionMinus, "ViewController under test is not composed of a buttonsOperataionMinus")
        XCTAssertNotNil(self.sut.buttonsOperataionDivide, "ViewController under test is not composed of a buttonsOperataionDivide")
        XCTAssertNotNil(self.sut.buttonsOperataionPercent, "ViewController under test is not composed of a buttonsOperataionPercent")
        XCTAssertNotNil(self.sut.buttonsOperataionMultiply, "ViewController under test is not composed of a buttonsOperataionMultiply")
        XCTAssertNotNil(self.sut.buttonsOperataionPlusMinus, "ViewController under test is not composed of a buttonsOperataionPlusMinus")
        XCTAssertNotNil(self.sut.buttonsOperataionSquareRoot, "ViewController under test is not composed of a buttonsOperataionSquareRoot")
    }
    
//    func testLabelAfterButtonTap() {
//        // 1. given
//        sut.buttonsNumbers.currentTitle
//        // 2. when
//        sut.buttonClearPressed(<#T##sender: UIButton##UIButton#>)
//        sut.buttonNumberPressed(sut.buttonsNumbers)
//        print(sut.buttonNumberPressed(sut.buttonsNumbers))
//        // 3. then
//        XCTAssertEqual(sut.labelResultDisplay.text, sut.buttonsNumbers.currentTitle)
//    }
    
}
