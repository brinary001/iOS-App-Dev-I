//
//  NewItemViewController.swift
//  Core Data App
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var location: Location?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        priceTextField.delegate = self         // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
    }
    
    @IBAction func saveItem(_ sender: Any) {
        let name = nameTextField.text
        let priceText = priceTextField.text ?? ""
        let price = Double(priceText) ?? 0.0
        let date = datePicker.date
        
        if let item = Item(name: name, price: price, date: date) {
            location?.addToRawItems(item)
            
            do {
                try item.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Item could not be created")
            }
        }
    }


}

extension NewItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

