//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by Brian Robinson on 5/6/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    /*struct converter {
        var fToC: Float
        var cToF: Float
        var mToK: Float
        var kToM: Float
        var label: String
        var inputUnit: String
        var outputUnit: String
    }*/
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var inputLabel: UILabel!
    
    var choice: Int = 1
    
    let fahrenheit = " °F"
    
    let celsius = " °C"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outputLabel.text = celsius
        
        inputLabel.text = fahrenheit
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func converterCall() {
        let script = ConverterController()
        let conversion = script.converterChoice(choice, inputDisplay.text!)
        outputDisplay?.text = conversion.newValue
    }
    
    func valueCall(){
        let script = ConverterController()
        let conversion = script.updateValue(choice)
        self.inputLabel?.text = conversion.initialValue
        self.outputLabel?.text = conversion.computedValue
    }
    
    @IBAction func converterOptions(_ sender: AnyObject) {
        // this example uses the .actionSheet style.  It could be set to another style such as .alert
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celsius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 1
            self.cTapped((Any).self)
            self.valueCall()
        }))
        alert.addAction(UIAlertAction(title: "celsius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 2
            self.cTapped((Any).self)
            self.valueCall()
            
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 3
            self.cTapped((Any).self)
            self.valueCall()
            
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 4
            self.cTapped((Any).self)
            self.valueCall()
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func plusMinusTapped(_ sender: Any) {
        inputDisplay.text = "-" + (inputDisplay?.text!)!
        converterCall()
    }
    @IBAction func cTapped(_ sender: Any) {
        outputDisplay.text = ""
        inputDisplay.text = ""
    }
    @IBAction func nineTapped(_ sender: Any) {
        inputDisplay.text? += "9"
        converterCall()
    }
    @IBAction func eightTapped(_ sender: Any) {
        inputDisplay.text? += "8"
        converterCall()
    }
    @IBAction func sevenTapped(_ sender: Any) {
        inputDisplay.text? += "7"
        converterCall()
    }
    @IBAction func sixTapped(_ sender: Any) {
        inputDisplay.text? += "6"
        converterCall()
    }
    @IBAction func fiveTapped(_ sender: Any) {
        inputDisplay.text? += "5"
        converterCall()
    }
    @IBAction func fourTapped(_ sender: Any) {
        inputDisplay.text? += "4"
        converterCall()
    }
    @IBAction func threeTapped(_ sender: Any) {
        inputDisplay.text? += "3"
        converterCall()
    }
    @IBAction func twoTapped(_ sender: Any) {
        inputDisplay.text? += "2"
        converterCall()
    }
    @IBAction func oneTapped(_ sender: Any) {
        inputDisplay.text? += "1"
        converterCall()
    }
    @IBAction func zeroTapped(_ sender: Any) {
        if (inputDisplay.text == "") {
            inputDisplay.text? += "0."
        } else {
            inputDisplay.text? += "0"
        }
        converterCall()
    }
    @IBAction func dotTapped(_ sender: Any) {
        if (inputDisplay.text?.contains(".") == false)
        {
            if (inputDisplay.text == "") {
                inputDisplay.text? += "0."
            } else {
                inputDisplay.text? += "."
            }
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
