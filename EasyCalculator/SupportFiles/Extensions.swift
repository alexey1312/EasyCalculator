//
//  Extensions.swift
//  EasyCalculator
//
//  Created by Admin on 21.01.2020.
//  Copyright © 2020 Aleksei Kakoulin. All rights reserved.
//

import Foundation

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
