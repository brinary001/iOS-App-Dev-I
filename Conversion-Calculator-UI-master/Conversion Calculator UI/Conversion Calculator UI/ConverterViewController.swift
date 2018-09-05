//
//  ConverterViewController.swift
//  Conversion Calculator UI
//
//  Created by Brian Robinson on 5/6/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    struct converter {
        var fToC: Float
        var cToF: Float
        var mToK: Float
        var kToM: Float
        var label: String
        var inputUnit: String
        var outputUnit: String
    }
    @IBOutlet weak var outputLabel: UITextField!
    
    @IBOutlet weak var inputLabel: UITextField!
    
    
    
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

    
    @IBAction func converterOptions(_ sender: AnyObject) {
        // this example uses the .actionSheet style.  It could be set to another style such as .alert
        let alert = UIAlertController(title: "", message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celsius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
        }))
        alert.addAction(UIAlertAction(title: "celsius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
        }))
        self.present(alert, animated: true, completion: nil)
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
