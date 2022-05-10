//
//  NumberViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        continueButton.isEnabled = phoneValidate(value: numberField.text ?? "")
    }
    
    func phoneValidate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{11}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }

}


