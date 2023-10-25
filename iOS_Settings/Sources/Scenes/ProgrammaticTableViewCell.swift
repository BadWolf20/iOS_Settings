//
//  ProgrammaticTableViewCell.swift
//  iOS_Settings
//
//  Created by Roman on 24.10.2023.
//

import UIKit
import SnapKit

class ProgrammaticTableViewCell: UITableViewCell {

    // MARK: - Properties
    static let reuseIdentifier = "ProgrammaticTableViewCell"
    var switchAction: ((Bool) -> Void)?



    // MARK: - Components
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()

    private lazy var rightMoveIcon: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.right")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill

        imageView.isHidden = true
        return imageView
    }()

    private lazy var rightSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isHidden = true
        toggle.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        return toggle
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Setup
    private func setupUI() {

        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {
        contentView.addSubview(iconImage)
        contentView.addSubview(mainLabel)
        contentView.addSubview(rightSwitch)
        contentView.addSubview(rightMoveIcon)
    }

    private func setupComponents() {

    }

    private func setupText() {
    }

    private func setupConstraints() {
        iconImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(iconImage.snp.height)
        }

        mainLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.left.equalTo(iconImage.snp.right).offset(16)
        }

        rightSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }

        rightMoveIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.width.equalTo(10)
        }
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

    @objc private func switchChanged() {
        switchAction?(rightSwitch.isOn)
    }

}
