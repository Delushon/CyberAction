//
//  MonthCell.swift
//  CyberAction
//
//  Created by Александр Паньшин on 11.05.2022.
//

import UIKit

class MonthCell: UICollectionViewCell {

    @IBOutlet weak var monthNameLabel: UILabel!
    @IBOutlet weak var mondayStackView: UIStackView!
    @IBOutlet weak var tuesdayStackView: UIStackView!
    @IBOutlet weak var wednesdayStackView: UIStackView!
    @IBOutlet weak var thursdayStackView: UIStackView!
    @IBOutlet weak var fridayStackView: UIStackView!
    @IBOutlet weak var saturdayStackView: UIStackView!
    @IBOutlet weak var sundayStackView: UIStackView!
    var stackViews: [UIStackView] = []
    var iterator = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        stackViews = [mondayStackView, tuesdayStackView, wednesdayStackView, thursdayStackView, fridayStackView, saturdayStackView, sundayStackView]
        for stackView in stackViews {
            for subView in (stackView.subviews as [UIView]) {
                subView.removeFromSuperview()
            }
        }
    }

}
