//
//  HistoryCell.swift
//  CyberAction
//
//  Created by Александр Паньшин on 10.05.2022.
//

import UIKit

class HistoryCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func prepareForReuse() {
        descriptionLabel.text = ""
        dateLabel.text = ""
    }
    
    func setup(history: History) {
        switch history.type {
            case .receive:
                descriptionLabel.text = "Зачислено \(history.amount)"
            case .spend:
                descriptionLabel.text = "Потрачено \(history.amount)"
        }
        dateLabel.text = history.date.dateString()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        let borderColor: UIColor = .black
        self.layer.borderColor = borderColor.cgColor
    }

}
