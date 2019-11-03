//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var buttonsArray = [UIButton]()
    var tip = 0.10
    var result: String = ""
    var resultBill: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsArray = [zeroPctButton, tenPctButton, twentyPctButton]
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        for button in buttonsArray {
            if button.isSelected {
                button.isSelected = false
            }
        }
        sender.isSelected = true
        
        switch sender{
        case zeroPctButton:
            tip = 0
        case tenPctButton:
            tip = 0.1
        case twentyPctButton:
            tip = 0.2
        default:
            print("error")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.0f", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let value = Double(billTextField.text!.replacingOccurrences(of: ",", with: ".")){
            
            resultBill = Bill(totalBill: value, tip: tip, persons: stepper.value)
            
            performSegue(withIdentifier: "secondVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC"{
            let secondVC = segue.destination as! ResultViewController
            guard let bill = resultBill else { return }
            secondVC.bill = bill
        }
    }
}

