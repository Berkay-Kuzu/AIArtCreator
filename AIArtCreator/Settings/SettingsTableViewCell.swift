//
//  SettingsTableViewCell.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 5.07.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: SettingsTableViewCell.self)
    
     let settingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 18)
        label.font = label.font.withSize(18)
        label.textColor = UIColor.black
        //        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(settingsLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        settingsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(settings: Settings) {
        settingsLabel.text = settings.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
