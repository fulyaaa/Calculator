//
//  ViewController.swift
//  Calculator
//
//  Created by fulya akan on 22.04.2026.
//

import UIKit

class ViewController: UIViewController {
    //homeviewcontroller yap
    
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
        let firstNumber = Double(firstValue) ?? 0
        let secondNumber = Double(secondValue) ?? 0
        var rawResult: Double = 0
        
        //code reviewda dizi mantıgına bakılacak
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
            result = String(format: "%2f", rawResult)
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
        guard !currentInput.contains(".") else { return }
        currentInput = currentInput.isEmpty ? "0." : currentInput + "."
        updateDisplay()
    }
    
    private func updateDisplay() {
        if currentInput.hasSuffix(".0") {
            currentInput = String(currentInput.dropLast(2))
        }
        let formattedText = currentInput.replacingOccurrences(of: ".", with: ",")
        resultLabel.text = formattedText.isEmpty ? "0" : formattedText
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

