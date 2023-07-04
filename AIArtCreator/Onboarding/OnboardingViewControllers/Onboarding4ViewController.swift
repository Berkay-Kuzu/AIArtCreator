//
//  Onboarding4ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit

class Onboarding4ViewController: UIViewController {
    
    private let startExploringButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Exploring", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startExploringButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureBackgroundImage()
        addSubviews()
        applyConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(startExploringButton)
        
    }
    
    private func applyConstraints(){
        startExploringButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            //            make.height.equalTo(50)
            make.height.equalToSuperview().multipliedBy(0.06)
            //            make.centerX.equalToSuperview()
        }
    }
    
    private func configureBackgroundImage() {
        let backgroundImage = UIImage(named: "img_onboarding4")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @objc private func startExploringButtonTapped() {
        let vc = InAppViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
