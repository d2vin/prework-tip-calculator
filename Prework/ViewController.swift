//
//  ViewController.swift
//  Prework
//
//  Created by Devin Minnihan on 8/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get the initial bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // get the total tip by multiple bill * tipPrecentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.02f", tip)
        
        //update toal amount
        totalLabel.text = String(format: "$%.02f", total)
    }
    
    @IBAction func onSlide(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %.02d%%", Int(tipPercentageSlider.value))
        // get the initial bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // get the total tip by multiple bill * tipPrecentage
        let tip: Double = Double(bill) * Double(Int(tipPercentageSlider.value)) * 0.01
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.02f", tip)
        
        //update toal amount
        totalLabel.text = String(format: "$%.02f", total)
    }
    
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
                
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            
            appDelegate?.overrideUserInterfaceStyle = .light
                
        } else {
            return
        }
    }
    
    
}

