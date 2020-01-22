//
//  ViewController.swift
//  EasyCalculator
//
//  Created by Admin on 10.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Initializers
    
    var mindCalculator: MindCalculator!
    
    // MARK: - Properties
    
    let viewIdentifier = "mainView"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var labelResultDisplay: UILabel!
    @IBOutlet weak var buttonsNum0: UIButton!
    @IBOutlet weak var buttonsNum1: UIButton!
    @IBOutlet weak var buttonsNum2: UIButton!
    @IBOutlet weak var buttonsNum3: UIButton!
    @IBOutlet weak var buttonsNum4: UIButton!
    @IBOutlet weak var buttonsNum5: UIButton!
    @IBOutlet weak var buttonsNum6: UIButton!
    @IBOutlet weak var buttonsNum7: UIButton!
    @IBOutlet weak var buttonsNum8: UIButton!
    @IBOutlet weak var buttonsNum9: UIButton!
    @IBOutlet weak var buttonsOperataionC: UIButton!
    @IBOutlet weak var buttonsOperataionPlusMinus: UIButton!
    @IBOutlet weak var buttonsOperataionPercent: UIButton!
    @IBOutlet weak var buttonsOperataionSum: UIButton!
    @IBOutlet weak var buttonsOperataionMinus: UIButton!
    @IBOutlet weak var buttonsOperataionMultiply: UIButton!
    @IBOutlet weak var buttonsOperataionDivide: UIButton!
    @IBOutlet weak var buttonsOperataionEqual: UIButton!
    @IBOutlet weak var buttonsOperataionDot: UIButton!
    @IBOutlet weak var buttonsOperataionSquareRoot: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = viewIdentifier

        mindCalculator = MindCalculator(labelResultDisplayText: labelResultDisplay!)
        mindCalculator.loadUserDefaultsData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        mindCalculator.saveUserDefaultsData()
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonNumberPressed(_ sender: UIButton) {
        let number = sender.currentTitle ?? "" //get the current value number
        mindCalculator.getPressedNumber(number)
    }
    
    @IBAction func buttonOperataionPressed(_ sender: UIButton) {
        mindCalculator.operationSign = sender.currentTitle ?? "" //get the current value operation
        mindCalculator.getPressedOperataion()
    }
    
    @IBAction func buttonEqualityPressed(_ sender: UIButton) {
        mindCalculator.equalFunc()
    }
    
    @IBAction func buttonClearPressed(_ sender: UIButton) {
        mindCalculator.clearFunc()
    }

    @IBAction func buttonPlusMinusPressed(_ sender: UIButton) {
        mindCalculator.invertFunc()
    }
    
    @IBAction func buttonPercentPressed(_ sender: UIButton) {
        mindCalculator.percentFunc()
    }
    
    @IBAction func buttonSquareRootPressed(_ sender: UIButton) {
        mindCalculator.squareRootFunc()
    }
    
    @IBAction func buttonDotPressed(_ sender: UIButton) {
        mindCalculator.addDotFunc()
    }
    
}
