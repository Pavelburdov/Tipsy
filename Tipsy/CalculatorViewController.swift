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


    var tip = 0.0
    var split = 2
    var bill = 0.0
    var resultTo2DecimalPlaces = "0.00"

    @IBAction func tipChanged(_ sender: UIButton) {

        // выделение цветом нажатых кнопок
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        let currentValue = sender.currentTitle!
        let convertStringValue = currentValue.dropLast()
        let buttonValue = Double(convertStringValue)!
        tip = buttonValue/100//чаевые

        billTextField.endEditing(true)
    }


    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNumberLabel.text = String(format: "%.0f", sender.value)
        split = Int(sender.value)

        //      let splitCount = Int(sender.value).description
        //        splitNumberLabel.text = splitCount
        //        split = splitCount
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let text = billTextField.text!
        if text != "" {
            bill = Double(text)!
        }

        let result = bill * (1 + tip) / Double(split)
        self.resultTo2DecimalPlaces = String(format: "%.2f", result)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.showRes = resultTo2DecimalPlaces
                destinationVC.split = split
                destinationVC.tip = Int(tip * 100)

            }
        }
}

