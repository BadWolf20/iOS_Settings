//
//  NibTableViewCell.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit

class NibTableViewCell: UITableViewCell, Reusable, NibLoadable {

    // MARK: - Componets Outlets
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var rightMoveIcon: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!


    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Configuration
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
