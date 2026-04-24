//
//  ViewController.swift
//  Calculator
//
//  Created by fulya akan on 22.04.2026.
//

import UIKit

class ViewController: UIViewController {
    
    var firstValue: Double = 0 //işlemden önceki sayı
    var secondValue: Double = 0 //işlemden sonraki sayı
    var currentOperation: String = ""
    var isTypingNumber: Bool = false //kullanıcı ikinci sayıyı yazmaya basladı

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        //take the number on button, sender yazdıgın butonu temsil eder
        guard let numberText = sender.currentTitle else { return }
        
        if isTypingNumber == true {
            //eğer islem butonuna basıldıktan sonra ılk rakamsa, ekran,
            resultLabel.text = numberText
            isTypingNumber = false
        } else {
            //add numver to label yazıyı labele ekle
            if resultLabel.text == "0" {
                resultLabel.text = numberText
            } else {
                // + --> string connection
                resultLabel.text = resultLabel.text! + numberText
            }
        }
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        guard let operationSign = sender.currentTitle else { return }
        
        if operationSign == "AC" {
            firstValue = 0
            secondValue = 0
            currentOperation = ""
            resultLabel.text = "0"
            isTypingNumber = false
        } else if operationSign == "=" {
            calculateResult()
            isTypingNumber = true //sonuctan sonra direk sayıya basılırsa ekran
        } else {
            currentOperation = operationSign
            firstValue = Double(resultLabel.text!)! // ?? 0
            isTypingNumber = true
        }
    }
    
    func calculateResult() {
        //ekranda görülen son sayıyı alıyoruz
        secondValue = Double(resultLabel.text!) ?? 0
        
        var result: Double = 0
        
        switch currentOperation {
        case "+":
            result = firstValue + secondValue
            resultLabel.text = String(result)
        case "-":
            result = firstValue - secondValue
            resultLabel.text = String(result)
        case "*":
            result = firstValue * secondValue
            resultLabel.text = String(result)
        case "÷":
            if secondValue != 0 {
                result = firstValue / secondValue
            } else {
                resultLabel.text = "Error"
                return
            }
        default:
            return
        }
        
        //sonucu ekranda goster fkaat ram sayı küsuratını gizle
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            resultLabel.text = String(format: "%.0f", result)
        } else {
            resultLabel.text = String(result)
        }
        
        firstValue = result
        
    }
}

