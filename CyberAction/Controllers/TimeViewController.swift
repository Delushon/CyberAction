//
//  TimeViewController.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var place: Place?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addressLabel.text = place?.address
        dateLabel.text = date?.dateString()
    }
    
    

}
