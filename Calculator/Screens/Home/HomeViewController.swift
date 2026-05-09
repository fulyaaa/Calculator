//
//  ViewController.swift
//  Calculator
//
//  Created by fulya akan on 22.04.2026.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private var currentInput: String = ""
    private var firstValue: String = ""
    private var secondValue: String = ""
    private var result: String = ""
    private var currentOperation: Operation? = nil
    
    @IBAction func numberPressed(_ sender: UIButton) {
        currentInput += "\(sender.tag)"
        updateDisplay()
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        if currentInput.isEmpty { return }
        firstValue = currentInput
        currentInput = ""
        currentOperation = Operation(rawValue: sender.tag)
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        secondValue = currentInput
        let standardizedFirstValue = firstValue.replacingOccurrences(of: ",", with: ".")
        let standardizedSecondValue = secondValue.replacingOccurrences(of: ",", with: ".")
        
        let firstNumber = Double(standardizedFirstValue) ?? 0
        let secondNumber = Double(standardizedSecondValue) ?? 0
        var rawResult: Double = 0
        
        switch currentOperation {
        case .add:
            rawResult = firstNumber + secondNumber
            result = "\(rawResult)"
        case .subtract:
            rawResult = firstNumber - secondNumber
            result = "\(rawResult)"
        case .modulus:
            if secondNumber != 0 {
                rawResult = firstNumber.truncatingRemainder(dividingBy: secondNumber)
                result = "\(rawResult)"
            }
        case .multiply:
            rawResult = firstNumber * secondNumber
            if rawResult.truncatingRemainder(dividingBy: 1) == 0 {
                result = "\(Int(rawResult))"
            } else {
                   result = String(format: "%.2f", rawResult)
               }
        case .divide:
            if secondNumber == 0 {
                result = "undefined"
            } else {
                rawResult = firstNumber / secondNumber
                result = formatter.string(from: NSNumber(floatLiteral: rawResult)) ?? "\(rawResult)"
                }
        case nil:
            break
        }
        
        currentInput = result
        updateDisplay()
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        clear()
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        let signedNumber = (Double(currentInput) ??  0) * -1
        currentInput = "\(signedNumber)"
        updateDisplay()
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if currentInput.contains(".") { return }
        currentInput = currentInput.isEmpty ? "0." : currentInput + "."
        updateDisplay()
    }
    
    private func updateDisplay() {
        if currentInput.isEmpty {
              resultLabel.text = "0"
              return
          }
        if currentInput.hasSuffix(".") {
            let formattedPart = formatString(String(currentInput.dropLast()))
              resultLabel.text = formattedPart + ","
          } else {
              resultLabel.text = formatString(currentInput)
          }
      }
    
    private func formatString(_ input: String) -> String {
        if let number = Double(input) {
            return formatter.string(from: NSNumber(value: number)) ?? input
        }
        return input
      }
    
    private func clear() {
        currentInput  = ""
        firstValue = ""
        secondValue = ""
        result = ""
        currentOperation = nil
        
        updateDisplay()
    }
    
}

