//
//  Home2ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 5.07.2023.
//

import UIKit
import Lottie
import CoreData
import Hero

class Home2VC: UIViewController {
    
    var fetch: Creator?
    
    let animationView = LottieAnimationView(name: "loading2")
    
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
    
    private let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_createFavorites")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
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
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_back")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
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
        
        applyAnimation()
    }
    
    private func addSubviews() {
        view.addSubview(home2ImageView)
        view.addSubview(regenerateButton)
        view.addSubview(exampleLabel)
        view.addSubview(favoritesButton)
        view.addSubview(saveButton)
        view.addSubview(animationView)
        view.addSubview(backButton)
    }
    
    private func applyConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        home2ImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-90)
//            make.bottom.equalToSuperview().offset(-30)
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
        favoritesButton.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        animationView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5) // Genişlik, ekran genişliğinin yarısı
            make.height.equalTo(animationView.snp.width)
            make.center.equalToSuperview()
        }
    }
    
    private func applyAnimation() {
        animationView.loopMode = .loop
        animationView.isHidden = true
        //        animationView.backgroundColor = .white
    }
    
    func regenerateData() {
        let creator = Creator(prompt: HomeVC().typeTextField.text, style: selectedTableViewData.tableViewDataName )
        NetworkManager.shared.fetchImageFromAPI(creator: creator) { [weak self] resultImg in
            creator.resultImg = resultImg
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.animationView.stop()
                self.home2ImageView.image = resultImg
            }
        }
    }
    
    @objc private func regenerateButtonTapped() {
        animationView.isHidden = false
        animationView.play()
        regenerateData()
    }
    
    @objc private func backButtonTapped() {
        let vc = HomeVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .right)
        present(vc, animated: true)
    }
    
    @objc private func favoritesButtonTapped() {
        if favoritesButton.currentImage == UIImage(named: "btn_favoritesUnselected") {
            favoritesButton.setImage(UIImage(named: "btn_favoritesSelected"), for: .normal)
            favoriteImageArray.append(self.home2ImageView.image!)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let newEntity = NSEntityDescription.insertNewObject(forEntityName: "AIArtCreator", into: context)
            
            let data = home2ImageView.image!.pngData()
            let stringData = exampleLabel.text
            
            newEntity.setValue(data, forKey: "favoriteImage")
            newEntity.setValue(stringData, forKey: "favoriteLabel")
            newEntity.setValue(UUID(), forKey: "id")
            
            do {
                try context.save()
                print("Data Saved successfully")
               
                
            } catch {
                print("This could not be saved successfully")
            }
            
        } else {
            favoritesButton.setImage(UIImage(named: "btn_favoritesUnselected"), for: .normal)
            
        }
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
        makeAlert(titleInput: "Artwork saved successfully!", messageInput: "The AI-generated artworkyou created has been successfully saved to photos")
    }
    
    // MARK: - UIAlertController
    
    public func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
