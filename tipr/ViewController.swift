//
//  ViewController.swift
//  tipr
//
//  Created by Kelly II, Richard W. on 8/3/16.
//  Copyright © 2016 Kelly II, Richard W. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var rateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    @IBAction func usePresetTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex])
        calculateTip(tipSlider)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(tipSlider.value)
        let total = bill + tip
        
        rateLabel.text = String(format: "%.2f", tipSlider.value)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

