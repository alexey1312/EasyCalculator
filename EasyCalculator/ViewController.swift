//
//  ViewController.swift
//  EasyCalculator
//
//  Created by Admin on 10.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stillTyping = false
    var dotIsPlace = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double {
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
    
    //edit status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var labelResultDisplay: UILabel!
    
    @IBAction func buttonNumberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        //character limit
        if stillTyping {
            if labelResultDisplay.text!.count < 20 {
                labelResultDisplay.text! += number
                UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
                print(UserDefaults.standard.isCurrentInput())
            }
        } else {
            labelResultDisplay.text! = number
            stillTyping = true
            UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
            print(UserDefaults.standard.isCurrentInput())
        }
    }
    
    @IBAction func buttonOperandsPressed(_ sender: UIButton) {
        
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlace = false
        UserDefaults.standard.setСurrentInput(value: String(firstOperand))
        print(UserDefaults.standard.isCurrentInput())
    }
    
    @IBAction func buttonEqualityPressed(_ sender: UIButton) {
        
        if stillTyping == true {
            secondOperand = currentInput
        }
        
        func operateWithTwoOperands(operation: (Double, Double) -> Double) {
            currentInput = operation(firstOperand, secondOperand)
            stillTyping = false
            UserDefaults.standard.setСurrentInput(value: String(currentInput))
            print(UserDefaults.standard.isCurrentInput())
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
        print(UserDefaults.standard.isCurrentInput())
    }
    
    @IBAction func buttonClearPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        labelResultDisplay.text = "0"
        stillTyping = false
        dotIsPlace = false
        operationSign = ""
        UserDefaults.standard.removeCurrentInput()
        print(UserDefaults.standard.isCurrentInput())
    }
    
    @IBAction func buttonPlusMinusPressed(_ sender: UIButton) {
        currentInput = -currentInput
        UserDefaults.standard.setСurrentInput(value: String(currentInput))
        print(UserDefaults.standard.isCurrentInput())
    }
    
    @IBAction func buttonPrecentagePressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput /= 100
            UserDefaults.standard.setСurrentInput(value: String(currentInput))
            print(UserDefaults.standard.isCurrentInput())
        } else {
            secondOperand = firstOperand * currentInput / 100
            UserDefaults.standard.setСurrentInput(value: String(currentInput))
            print(UserDefaults.standard.isCurrentInput())
        }
    }
    
    @IBAction func buttonSquareRootPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
        UserDefaults.standard.setСurrentInput(value: String(currentInput))
        print(UserDefaults.standard.isCurrentInput())
    }
    
    @IBAction func buttonDotPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlace {
            dotIsPlace = true
            labelResultDisplay.text = labelResultDisplay.text! + "."
            UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
            print(UserDefaults.standard.isCurrentInput())
        } else if !stillTyping && !dotIsPlace {
            dotIsPlace = true
            labelResultDisplay.text = "0."
            stillTyping = true
            UserDefaults.standard.setСurrentInput(value: labelResultDisplay.text!)
            print(UserDefaults.standard.isCurrentInput())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load UserdDefaults value
        currentInput = UserDefaults.standard.isCurrentInput()
        print(UserDefaults.standard.isCurrentInput())
    }
}

extension UserDefaults {
    
    // MARK: Save
    func setСurrentInput(value: String) {
        set(value, forKey: "currentInput")
    }
    
    // MARK: Load
    func isCurrentInput() -> Double {
        return double(forKey: "currentInput")
    }
    
    // MARK: Remove
    func removeCurrentInput() {
        removeObject(forKey: "currentInput")
    }
}
