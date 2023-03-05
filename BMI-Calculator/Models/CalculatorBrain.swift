//
//  CalculatorBrain.swift
//  BMI-Calculator
//
//  Created by Sonata Girl on 05.03.2023.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        var bmi: (Float ,String, UIColor)
        
        if bmiValue < 18.5 {
            bmi = (bmiValue, "Eat more pies!", UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = (bmiValue, "Fit as a fiddle!", UIColor.green)
        } else {
            bmi = (bmiValue, "Eat less pies!", UIColor.systemPink)
        }
        
        self.bmi = BMI(value: bmi.0, advice: bmi.1, color: bmi.2)
    }
    
    func getBMIValue() -> String {
        return "\(String(format: "%.1f", bmi?.value ?? 0.0))"
    }
    
    func getBMI() -> BMI {
        return bmi ?? BMI(value: 0.0, advice: "", color: UIColor.black
)
    }
}
