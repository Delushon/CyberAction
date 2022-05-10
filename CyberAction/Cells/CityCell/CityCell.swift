//
//  CityCell.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class CityCell: UICollectionViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        let borderColor: UIColor = .black
        self.layer.borderColor = borderColor.cgColor
    }
    
    override func prepareForReuse() {
        cityLabel.text = ""
    }
    
    func setup(city: City) {
        cityLabel.text = city.name
    }

}
