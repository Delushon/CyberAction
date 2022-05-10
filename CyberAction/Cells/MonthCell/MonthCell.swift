//
//  MonthCell.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import UIKit

class MonthCell: UICollectionViewCell {

    @IBOutlet weak var mondayStackView: UIStackView!
    @IBOutlet weak var tuesdayStackView: UIStackView!
    @IBOutlet weak var wednesdayStackView: UIStackView!
    @IBOutlet weak var thursdayStackView: UIStackView!
    @IBOutlet weak var fridayStackView: UIStackView!
    @IBOutlet weak var saturdayStackView: UIStackView!
    @IBOutlet weak var sundayStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setup(month: Month) {
        print(month.name)
        print(month.numberOfYear)
        print(month.numberOfMonth)
        print(month.daysCount)
        print(month.firstDayOfWeek)
        print("-----------")
    }

}
