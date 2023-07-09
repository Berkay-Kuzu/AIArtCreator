//
//  ExamplesCollectionViewCell.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 8.07.2023.
//

import UIKit

class ExamplesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ExamplesCollectionViewCell.self)
    
    let exampleNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentview()
        applyConstraints()
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContentview() {
        contentView.addSubview(exampleNameLabel)
    }
    
    func applyConstraints() {
        
        exampleNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
