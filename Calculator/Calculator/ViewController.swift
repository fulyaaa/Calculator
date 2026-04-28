//
//  ViewController.swift
//  Calculator
//
//  Created by fulya akan on 22.04.2026.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: Int {
        case add = 10
        case subtract = 11
        case multiply = 12
        case divide = 13
        case none = 0 //bir islem yapılmadıysa
    }
    
    var runningNumber: String = "" //ekranda o an yazan sayı
    var leftValue: String = ""
    var rightValue: String = ""
    var result: String = ""
    var currentOperation: Operation = .none
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        //resultLabel.text = runningNumber
        updateDisplay()
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        currentOperation = Operation(rawValue: sender.tag) ?? .none
        leftValue = runningNumber //ekrana yazılmıs sayıyı soldaki değer olarak kaydet
        runningNumber = ""
        
        //updateDisplay()
        //resultLabel.text = "" //operation verdiğimde text temizlensin
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        rightValue = runningNumber
        let firstNumber = Double(leftValue) ?? 0
        let secondNumber = Double(rightValue) ?? 0
        var rawResult: Double = 0
        
        switch currentOperation {
        case .add:
            rawResult = firstNumber + secondNumber
            result = "\(rawResult)"
        case .subtract:
            rawResult = firstNumber - secondNumber
            result = "\(rawResult)"
        case .multiply:
            rawResult = firstNumber * secondNumber
            result = "\(rawResult)"
        case .divide:
            rawResult = firstNumber / secondNumber
            if String(rawResult).count > 3 {
                result = String(format: "%.3g", rawResult)
            } else {
                result = "\(rawResult)"
            }
        case .none:
            break
        }
        
        runningNumber = result //sonucu saklıyorum
        //resultLabel.text = result
        updateDisplay()
        
      
        updateDisplay()
        //resultLabel.text = result
        //leftvalue = result
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        //arka plandaki verileri sıfırlar
        runningNumber  = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .none
        
        updateDisplay()
        //resultLabel.text = "0" // kullanıcıya her seyın sılındıgını gosterır. bir görsel nesne oldugu ıcın.text diyoruz fakat yukarıdakiler gorsel nesne değil string direk "" denir
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        let signedNumber = (Double(runningNumber) ??  0) * -1
        runningNumber = "\(signedNumber)" // hafızaya kaydet - Stringe cevirmemize gerek kalmadı \ aynı işi yapar
        //resultLabel.text = runningNumber
        updateDisplay()
    }
    
    @IBAction func percentPressed(_ sender: UIButton) {
        let signedNumber = (Double(runningNumber) ??  0) / 100
        runningNumber = "\(signedNumber)"
        //resultLabel.text = runningNumber
        updateDisplay()
    }
    
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
            //if runningNumber.isEmpty {
            //runningNumber += "0."
            //} else {
            //    runningNumber += "."
            //}
            //resultLabel.text = runningNumber.replacingOccurrences(of: ".", with: ",")
        }
        
    }
    
}

