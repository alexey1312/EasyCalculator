//
//  ViewController.swift
//  EasyCalculator
//
//  Created by Admin on 10.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit
import SwiftUI

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
            labelResultDisplay.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    @IBOutlet weak var labelResultDisplay: UILabel!
    
    @IBAction func buttonNumberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if labelResultDisplay.text!.count < 20 {
                labelResultDisplay.text! += number
            }
        } else {
            labelResultDisplay.text! = number
            stillTyping = true
        }
    }
    
    @IBAction func buttonOperandsPressed(_ sender: UIButton) {
        
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
    }
    
    @IBAction func buttonEqualityPressed(_ sender: UIButton) {
        
        if stillTyping == true {
            secondOperand = currentInput
        }
        
        func operateWithTwoOperands(operation: (Double, Double) -> Double) {
            currentInput = operation(firstOperand, secondOperand)
            stillTyping = false
        }
        
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
    
    @IBAction func buttonClearPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        labelResultDisplay.text = "0"
        stillTyping = false
        operationSign = ""
    }
   
    @IBAction func buttonPlusMinusPressed(_ sender: UIButton) {
        currentInput = -currentInput
        
    }
    
    @IBAction func buttonPrecentagePressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    
    @IBAction func buttonSquareRootPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    
    @IBAction func buttonDotPressed(_ sender: UIButton) {
        if stillTyping && dotIsPlace {
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SwiftLeeViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!.view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
    
    @available(iOS 13.0, *)
    struct SwiftLeeViewController_Preview: PreviewProvider {
        
        static var previews: some View {
            SwiftLeeViewRepresentable()
        }
        
    }
}
#endif
