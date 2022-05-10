//
//  CodeViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class CodeViewController: UIViewController {

    @IBOutlet weak var codeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        if codeValidate(value: codeField.text ?? "") {
            User.initFictiveUser()
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func codeValidate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
