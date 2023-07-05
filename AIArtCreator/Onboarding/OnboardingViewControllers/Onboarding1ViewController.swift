//
//  ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 3.07.2023.
//

import UIKit

class Onboarding1ViewController: UIViewController {
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Img_Onboarding.png")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 30)
        label.font = label.font.withSize(30)
//        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let aiArtCreatorLabel: UILabel = {
        let label = UILabel()
        label.text = "AI Art Creator"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 30)
        label.font = label.font.withSize(30)
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let loremLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        label.font = UIFont(name: "Inter", size: 15)
        label.font = label.font.withSize(15)
        label.textColor = UIColor(red: 0.42, green: 0.39, blue: 0.39, alpha: 1.00)
//        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(400))
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        configureNavBar()
    }
    
    private func addSubviews() {
//        view.addSubview(onboardingImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(aiArtCreatorLabel)
        view.addSubview(loremLabel)
        view.addSubview(continueButton)
    }
    
    private func applyConstraints(){
        
        view.addSubview(onboardingImageView)
        onboardingImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardingImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        aiArtCreatorLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        loremLabel.snp.makeConstraints { make in
            make.top.equalTo(aiArtCreatorLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
//            make.left.right.equalToSuperview().inset(60)
//            make.height.equalTo(50)
            make.height.equalToSuperview().multipliedBy(0.06)
//            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func continueButtonTapped() {
        let vc = Onboarding2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationController?.navigationItem.largeTitleDisplayMode = .always
        //        navigationController?.navigationBar.tintColor = .black
    }
    
    
}

