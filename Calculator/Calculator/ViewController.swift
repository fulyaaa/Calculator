//
//  ViewController.swift
//  Calculator
//
//  Created by fulya akan on 22.04.2026.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: Double = 0 //işlemden önceki sayı
    var secondNumber: Double = 0 //işlemden sonraki sayı
    var currentAction: String = ""
    var writingNumber: Bool = false //kullanıcı ikinci sayıyı yazmaya basladı 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        //take the number on button, sender yazdıgın butonu temsil eder
        guard let number = sender.currentTitle else { return }
        
        //add numver to label yazıyı labele ekle
        if resultLabel.text == "0" {
            resultLabel.text = number
        } else {
            // + --> string connection
            resultLabel.text = resultLabel.text! + number
        }

    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
    }
}

