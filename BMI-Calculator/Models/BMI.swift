//
//  BMI.swift
//  BMI-Calculator
//
//  Created by Sonata Girl on 05.03.2023.
//

import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color : UIColor
    
    func getBMIValue() -> String {
        return "\(String(format: "%.1f", value))"
    }
    
}

