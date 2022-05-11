//
//  TimeCell.swift
//  CyberAction
//
//  Created by Александр Паньшин on 12.05.2022.
//

import UIKit

class TimeCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        timeLabel.text = "HH:MM"
    }

}
