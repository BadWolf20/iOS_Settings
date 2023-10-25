//
//  NibTableViewCell.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit

class NibTableViewCell: UITableViewCell {
    static let reuseIdentifier = "NibTableViewCell"

    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var rightMoveIcon: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(with data: Setting) {
        mainLabel.text = data.name
        iconImage.image = data.imageMain

        switch data.style {
        case .check:
            rightSwitch.isHidden = false
        case .move:
            rightMoveIcon.isHidden = false
        }
    }

}
