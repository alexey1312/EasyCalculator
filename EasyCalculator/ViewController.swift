//
//  ViewController.swift
//  EasyCalculator
//
//  Created by Admin on 10.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var labelResultDisplay: UILabel!
    
    // MARK: - Private Properties
    private let viewIdentifier = "mainView"
    private var stillTyping = false
    private var dotIsPlace = false
    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var operationSign: String = ""
    private var currentInput: Double {
        get {
            return Double(labelResultDisplay.text!)!
        } set {
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.accessibilityIdentifier = viewIdentifier
        loadCurrentInput()
    }
    
    // MARK: - Private Methods
    
    private func loadCurrentInput() {
        currentInput = UserDefaults.standard.isCurrentInput() //load UserdDefaults value
    }

    private func clearFunc() {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        labelResultDisplay.text = "0"
        stillTyping = false
        dotIsPlace = false
        operationSign = ""
        UserDefaults.standard.removeCurrentInput()
    }

    private func invertFunc() {
        currentInput = -currentInput
        UserDefaults.standard.setСurrentInput(value: String(currentInput))
    }

    private func percentFunc() {
        if firstOperand == 0 {
            currentInput /= 100
            UserDefaults.standard.setСurrentInput(value: String(currentInput))
        } else {
            secondOperand = firstOperand * currentInput / 100
            UserDefaults.standard.setСurrentInput(value: String(currentInput))
        }
    }

    private func squareRootFunc() {
        currentInput = sqrt(currentInput)
        UserDefaults.standard.setСurrentInput(value: String(currentInput))
    }

    private func addDotFunc() {
        if stillTyping && !dotIsPlace {
            dotIsPlace = true
            labelResultDisplay.text = labelResultDisplay.text! + "."
            UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
        } else if !stillTyping && !dotIsPlace {
            dotIsPlace = true
            labelResultDisplay.text = "0."
            stillTyping = true
            UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
        }
    }

    private func equalFunc() {
        if stillTyping == true {
            secondOperand = currentInput
        }
        func operateWithTwoOperands(operation: (Double, Double) -> Double) {
            currentInput = operation(firstOperand, secondOperand)
            stillTyping = false
            UserDefaults.standard.setСurrentInput(value: String(currentInput))
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
    }

    private func getPressedOperataion() {
        firstOperand = currentInput
        stillTyping = false
        dotIsPlace = false
        UserDefaults.standard.setСurrentInput(value: String(firstOperand))
    }

    private func getPressedNumber(_ number: String) {
        if stillTyping { //character limit
            if labelResultDisplay.text!.count < 20 {
                labelResultDisplay.text! += number
                UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
            }
        } else {
            labelResultDisplay.text! = number
            stillTyping = true
            UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
        }
    }

    // MARK: - IBActions
    
    @IBAction func buttonNumberPressed(_ sender: UIButton) {
        let number = sender.currentTitle! //get the current value numbers
        getPressedNumber(number)
    }
    
    @IBAction func buttonOperandsPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle! //get the current value operation
        getPressedOperataion()
    }
    
    @IBAction func buttonEqualityPressed(_ sender: UIButton) {
        equalFunc()
    }
    
    @IBAction func buttonClearPressed(_ sender: UIButton) {
        clearFunc()
    }
    
    @IBAction func buttonPlusMinusPressed(_ sender: UIButton) {
        invertFunc()
    }
    
    @IBAction func buttonPercentPressed(_ sender: UIButton) {
        percentFunc()
    }
    
    @IBAction func buttonSquareRootPressed(_ sender: UIButton) {
        squareRootFunc()
    }
    
    @IBAction func buttonDotPressed(_ sender: UIButton) {
        addDotFunc()
    }
    
}

//MARK: Extentions UserDefaults

extension UserDefaults {
    func setСurrentInput(value: String) {
        set(value, forKey: "currentInput")
    }
    
    func isCurrentInput() -> Double {
        return double(forKey: "currentInput")
    }
    
    func removeCurrentInput() {
        removeObject(forKey: "currentInput")
    }
}
