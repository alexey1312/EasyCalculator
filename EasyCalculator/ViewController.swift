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
    
    @IBOutlet weak var labelResultDisplay: UILabel?
    
    // MARK: - Private Properties
    private let viewIdentifier = "mainView"
    private(set) var stillTyping = false
    private(set) var dotIsPlace = false
    private(set) var firstOperand: Double = 0
    private(set) var secondOperand: Double = 0
    private(set) var operationSign: String = ""
    private(set) var currentInput: Double {
        get {
            return Double(labelResultDisplay?.text ?? "0")!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                labelResultDisplay?.text = "\(valueArray[0])"
            } else {
                labelResultDisplay?.text = "\(newValue)"
                dotIsPlace = true
            }
            stillTyping = false
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = viewIdentifier
        loadUserDefaultsData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        saveUserDefaultsData()
    }
    
    // MARK: - Private Methods
    
    private func loadUserDefaultsData() {
        currentInput = UserDefaults.standard.isCurrentInput()
    }
    
    private func saveUserDefaultsData() {
        UserDefaults.standard.setСurrentInput(value: String(currentInput))
    }
    
    private func removeUserDefaultsData() {
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
            dotIsPlace = true
            labelResultDisplay?.text = (labelResultDisplay?.text ?? "0") + "."
        } else if !stillTyping && !dotIsPlace {
            dotIsPlace = true
            labelResultDisplay?.text = "0."
            stillTyping = true
        }
    }
    
    func equalFunc() {
        if stillTyping == true {
            secondOperand = currentInput
        }
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
            if secondOperand != 0 {
                operateWithTwoOperands {$0 / $1}
            } else { labelResultDisplay?.text = "Error" }
        default: break
        }
    }
    
    private func getPressedOperataion() {
        firstOperand = currentInput
        stillTyping = false
        dotIsPlace = false
    }
    
    private func getPressedNumber(_ number: String) {
        if stillTyping { //character limit
            if labelResultDisplay?.text!.count ?? 0 < 20 {
                labelResultDisplay?.text! += number
            }
        } else {
            labelResultDisplay?.text! = number
            stillTyping = true
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
