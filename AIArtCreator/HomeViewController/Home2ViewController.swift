//
//  Home2ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 5.07.2023.
//

import UIKit
import Lottie

class Home2ViewController: UIViewController {
    
    var fetch: Creator?
    
    private let home2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "img_home17.png")
        return imageView
    }()
    
     let exampleLabel: UILabel = {
        let label = UILabel()
//        label.text = "Example 3"
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
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        
        home2ImageView.image = fetch?.resultImg
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black
    
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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
    
    func regenerateData() {
        let creator = Creator(prompt: HomeViewController().typeTextField.text, style: selectedTableViewData.tableViewDataName )
        NetworkManager.shared.fetchImageFromAPI(creator: creator) { [weak self] resultImg in
            creator.resultImg = resultImg
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.home2ImageView.image = resultImg
            }
        }
    }
    
    @objc private func regenerateButtonTapped() {
        regenerateData()
    }
    
    @objc private func createFavoritesButtonTapped() {
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            if let error = error {
                let alert = UIAlertController(title: "Saving error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Artwork saved successfully!", message: " The AI-generated artwork you created has been succesfully saved to photos.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
    
    @objc private func saveButtonTapped() {
        UIImageWriteToSavedPhotosAlbum(home2ImageView.image ?? UIImage(), self, #selector(image(_:didFinishSavingWithError: contextInfo:)), nil)
    }

}
