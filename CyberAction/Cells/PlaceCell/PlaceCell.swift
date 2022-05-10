//
//  PlaceCell.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class PlaceCell: UICollectionViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        let borderColor: UIColor = .black
        self.layer.borderColor = borderColor.cgColor
    }
    
    override func prepareForReuse() {
        addressLabel.text = ""
    }
    
    func setup(place: Place) {
        addressLabel.text = place.address
    }

}
