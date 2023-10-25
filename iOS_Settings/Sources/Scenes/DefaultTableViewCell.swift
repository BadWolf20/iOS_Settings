//
//  SettingsTableViewCell.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
    static let reuseIdentifier = "DefaultTableViewCell"

    // При повторном использовании ячейки сбрасываем настройки
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
