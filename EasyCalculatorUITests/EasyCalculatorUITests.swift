//
//  EasyCalculatorUITests.swift
//  EasyCalculatorUITests
//
//  Created by Admin on 13.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import XCTest

class EasyCalculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
    }
    
    func testLoadMainView() {
        XCTAssertTrue(app.isOnMainView)
    }
    
    func testClickNumbersButtoms() {
        let buttonC = app.buttons["C"]
        buttonC.tap()
        
        let button1 = app.buttons["1"]
        button1.tap()
        buttonC.tap()
        
        let button2 = app.buttons["2"]
        button2.tap()
        buttonC.tap()
        
        let button3 = app.buttons["3"]
        button3.tap()
        buttonC.tap()
        
        let button4 = app.buttons["4"]
        button4.tap()
        buttonC.tap()
        
        let button5 = app.buttons["5"]
        button5.tap()
        buttonC.tap()
        
        let button6 = app.buttons["6"]
        button6.tap()
        buttonC.tap()
        
        let button7 = app.buttons["7"]
        button7.tap()
        buttonC.tap()
        
        let button8 = app.buttons["8"]
        button8.tap()
        buttonC.tap()
        
        let button9 = app.buttons["9"]
        button9.tap()
        buttonC.tap()
        
        let button0 = app.buttons["0"]
        button0.tap()
        buttonC.tap()
    }
    
    func testClickOperataionButtoms() {
        app/*@START_MENU_TOKEN@*/.buttons["C"]/*[[".otherElements[\"mainView\"].buttons[\"C\"]",".buttons[\"C\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["="]/*[[".otherElements[\"mainView\"].buttons[\"=\"]",".buttons[\"=\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["+/-"]/*[[".otherElements[\"mainView\"].buttons[\"+\/-\"]",".buttons[\"+\/-\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["%"]/*[[".otherElements[\"mainView\"].buttons[\"%\"]",".buttons[\"%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["+"]/*[[".otherElements[\"mainView\"].buttons[\"+\"]",".buttons[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["-"]/*[[".otherElements[\"mainView\"].buttons[\"-\"]",".buttons[\"-\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["×"]/*[[".otherElements[\"mainView\"].buttons[\"×\"]",".buttons[\"×\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["÷"]/*[[".otherElements[\"mainView\"].buttons[\"÷\"]",".buttons[\"÷\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["√"]/*[[".otherElements[\"mainView\"].buttons[\"√\"]",".buttons[\"√\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["."]/*[[".otherElements[\"mainView\"].buttons[\".\"]",".buttons[\".\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }

}

//MARK: Extentions

extension XCUIApplication {
    var isOnMainView: Bool  {
        return otherElements["mainView"].exists
    }
}
