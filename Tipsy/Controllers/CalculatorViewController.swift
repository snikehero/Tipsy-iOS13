//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        //If the text is not an empty String ""
        if bill != "" {
            
            //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
            //e.g. 125.50
            billTotal = Double(bill)!
            
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            //Round the result to 2 decimal places and turn it into a String.
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
        }
}

@IBAction func stepperValueChanged(_ sender: UIStepper) {
    splitNumberLabel.text = String(format: "%.0f", sender.value)
    numberOfPeople = Int(sender.value)
}
@IBAction func tipChanged(_ sender: UIButton) {
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    sender.isSelected = true
    print("\(sender.currentTitle!) is selected")
    let buttonTitle = sender.currentTitle!
    
    //Remove the last character (%) from the title then turn it back into a String.
    let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
    
    //Turn the String into a Double.
    let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
    
    //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
    tip = buttonTitleAsANumber / 100
    billTextField.endEditing(true)
}
}

