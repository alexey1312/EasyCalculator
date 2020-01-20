//
//  Extension.swift
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

//MARK: Extentions UserDefaults

extension String {
    // remove the '.0' when the number is not decimal
    func removeAfterPointIfZero() -> String {
        let token = self.components(separatedBy: ".")
        
        if !token.isEmpty && token.count == 2 {
            switch token[1] {
            case "0", "00", "000", "0000", "00000", "000000":
                return token[0]
            default:
                return self
            }
        }
        return self
    }
}
