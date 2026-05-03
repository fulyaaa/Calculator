//
//  ViewController.swift
//  Calculator
//
//  Created by fulya akan on 22.04.2026.
//

import UIKit

class ViewController: UIViewController {
    //homeviewcontroller yap
    
    enum Operation: Int {
        case add = 10
        case subtract
        case multiply
        case divide
        case modulus = 14
    }
    
    var runningNumber: String = ""
    var leftValue: String = ""
    var rightValue: String = ""
    var result: String = ""
    var currentOperation: Operation? = nil
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        updateDisplay()
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        if runningNumber == "" {
            return
        }
        leftValue = runningNumber
        runningNumber = ""
        currentOperation = Operation(rawValue: sender.tag)
        
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        rightValue = runningNumber
        let firstNumber = Double(leftValue) ?? 0
        let secondNumber = Double(rightValue) ?? 0
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
                //???
            }
        case .multiply:
            rawResult = firstNumber * secondNumber
            if String(rawResult).count > 8 {
                result = String(format: "%2f", rawResult)
            } else {
                result = "\(rawResult)"
            }
        case .divide:
            if secondNumber == 0 {
                result = "undefined"
            } else {
                rawResult = firstNumber / secondNumber
                if rawResult.truncatingRemainder(dividingBy: 1) == 0 {
                    result = "\(Int(rawResult))"
                } else {
                    result = String(format: "%.2f", rawResult)
                    
                    while result.hasSuffix("0"){
                        result.removeLast()
                    }
                    if result.hasSuffix("."){
                        result.removeLast()
                    }
                }
            }
        case nil:
            break
        }
        
        runningNumber = result
        updateDisplay()
        
        updateDisplay()
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        runningNumber  = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = nil
        
        updateDisplay()
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        let signedNumber = (Double(runningNumber) ??  0) * -1
        runningNumber = "\(signedNumber)"
        updateDisplay()
    }
    
   // @IBAction func percentPressed(_ sender: UIButton) {
     //   let signedNumber = (Double(runningNumber) ??  0) / 100
       // runningNumber = "\(signedNumber)"
        //updateDisplay()
  //  }
    
    func updateDisplay() {
        if runningNumber.hasSuffix(".0") {
            runningNumber = String(runningNumber.dropLast(2))
        }
        let formattedText = runningNumber.replacingOccurrences(of: ".", with: ",")
        resultLabel.text = formattedText.isEmpty ? "0" : formattedText
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if !runningNumber.contains(".") {
            runningNumber = runningNumber.isEmpty ? "0." : runningNumber + "."
            updateDisplay()
        }
    }
}

