//
//  MindCalculator.swift
//  EasyCalculator
//
//  Created by Admin on 19.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import UIKit

class MindCalculator {
    
    // MARK: - Private Properties
    var labelResultDisplay: UILabel
    var stillTyping = false
    var dotIsPlace = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var currentInput: Double {
        get {
            if self.labelResultDisplay.text == "Error" {
                clearFunc()
            }
            return Double(self.labelResultDisplay.text ?? "0")!
        }
        set {
            if newValue.isInfinite || newValue.isNaN {
                labelResultDisplay.text = "Error"
            } else {
                let value = "\(newValue)"
                let valueArray = value.components(separatedBy: ".")
                if valueArray[1] == "0" {
                    labelResultDisplay.text = "\(valueArray[0])"
                } else {
                    labelResultDisplay.text = "\(newValue)"
                    dotIsPlace = true
                }
                stillTyping = false
            }
        }
    }
    
    // MARK: - Initializers
    
    init(labelResultDisplayText: UILabel) {
        self.labelResultDisplay = labelResultDisplayText
    }
    
    // MARK: - Private Methods
    
    func loadUserDefaultsData() {
        currentInput = UserDefaults.standard.isCurrentInput()
    }
    
    func saveUserDefaultsData() {
        UserDefaults.standard.setСurrentInput(value: String(currentInput))
    }
    
    func removeUserDefaultsData() {
        UserDefaults.standard.removeCurrentInput()
    }
    
    func clearFunc() {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        stillTyping = false
        dotIsPlace = false
        operationSign = ""
        removeUserDefaultsData()
    }
    
    func invertFunc() {
        currentInput = -currentInput
    }
    
    func percentFunc() {
        if firstOperand == 0 {
            currentInput /= 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    func squareRootFunc() {
        currentInput = sqrt(currentInput)
    }
    
    func addDotFunc() {
        if stillTyping && !dotIsPlace {
            labelResultDisplay.text = (labelResultDisplay.text!) + "."
            dotIsPlace = true
        } else if !stillTyping && !dotIsPlace {
            dotIsPlace = true
            stillTyping = true
            labelResultDisplay.text = "0."
        }
    }
    
    func equalFunc() {
        func operateWithTwoOperands(operation: (Double, Double) -> Double) {
            currentInput = operation(firstOperand, secondOperand)
            stillTyping = false
        }
        dotIsPlace = false
        switch operationSign {
        case "+":
            operateWithTwoOperands {$0 + $1}
        case "-":
            operateWithTwoOperands {$0 - $1}
        case "×":
            operateWithTwoOperands {$0 * $1}
        case "÷":
            operateWithTwoOperands {$0 / $1}
        default: break
        }
        if stillTyping == true {
            secondOperand = currentInput
        }
    }
    
    func getPressedOperataion() {
        firstOperand = currentInput
        stillTyping = false
        dotIsPlace = false
    }
    
    func getPressedNumber(_ number: String) {
        if stillTyping { //character limit
            if labelResultDisplay.text?.count ?? 0 < 20 {
                labelResultDisplay.text? += number
            }
        } else {
            labelResultDisplay.text = number
            stillTyping = true
        }
    }
    
}
