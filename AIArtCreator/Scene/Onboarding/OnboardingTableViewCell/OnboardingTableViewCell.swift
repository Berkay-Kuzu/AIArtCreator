//
//  OnboardingTableViewCell.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 3.07.2023.
//

import UIKit

class OnboardingTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: OnboardingTableViewCell.self)
    
    private let loremLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eicia deserunt mollit anim id"
        label.font = UIFont(name: "Inter", size: 12)
        label.font = label.font.withSize(12)
        label.textColor = UIColor(red: 0.42, green: 0.39, blue: 0.39, alpha: 1.00)
        //        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(600))
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(loremLabel)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        
        applyConstraints()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            contentView.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
            loremLabel.textColor = UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.00)
        } else {
            contentView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
            loremLabel.textColor = UIColor(red: 0.42, green: 0.39, blue: 0.39, alpha: 1.00)
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        loremLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
