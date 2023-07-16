//
//  CustomLabel.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 14.07.2023.
//

import UIKit
import SnapKit

final class InappFeatureView: UIView {
    
    let imageLogo = UIImageView()
    let label = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        label.text = title
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
//        self.backgroundColor = .red
        
        imageLogo.contentMode = .scaleAspectFit
        imageLogo.image = UIImage(named: "check-circle")
        addSubview(imageLogo)
        imageLogo.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
           
        }
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Inter", size: 18)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(imageLogo.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
    }
}
