//
//  Home2ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 5.07.2023.
//

import UIKit

class Home2ViewController: UIViewController {
    
    private let home2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "img_home17.png")
        return imageView
    }()
    
    private let exampleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example 3"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 15)
        label.font = label.font.withSize(15)
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let regenerateButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_createNew")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(regenerateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let createFavoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_createFavorites")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(createFavoritesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_createDownload")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(createFavoritesButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(home2ImageView)
        view.addSubview(regenerateButton)
        view.addSubview(exampleLabel)
        view.addSubview(createFavoritesButton)
        view.addSubview(saveButton)
    }
    
    private func applyConstraints() {
        home2ImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            
        }
        
        exampleLabel.snp.makeConstraints { make in
            make.top.equalTo(home2ImageView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        
        regenerateButton.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        createFavoritesButton.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    @objc private func regenerateButtonTapped() {
        
    }
    
    @objc private func createFavoritesButtonTapped() {
        
    }

}
