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
    
    // MARK: - Private Properties
    
    private let viewIdentifier = "mainView"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var labelResultDisplay: UILabel!
    
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
        let number = sender.currentTitle! //get the current value number
        mindCalculator.getPressedNumber(number)
    }
    
    @IBAction func buttonOperandsPressed(_ sender: UIButton) {
        mindCalculator.operationSign = sender.currentTitle! //get the current value operation
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
