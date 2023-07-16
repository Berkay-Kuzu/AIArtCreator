//
//  CustomView.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 14.07.2023.
//

import UIKit
import SnapKit

final class Button: UIButton {
    
//    let image = UIImageView()
    let label = UILabel()
    let buttonBorder = UIView()
    
    init(title: String) {
        super.init(frame: .zero)
        label.text = title
//        image.image = photo
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Inter", size: 18)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        buttonBorder.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        addSubview(buttonBorder)
        buttonBorder.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(label.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
    }
}
