//
//  FavoritesDetailViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 11.07.2023.
//

import UIKit
import CoreData
import Lottie


class FavoritesDetailVC: UIViewController {
    
    var favoriteImage: UIImage?
    var favoriteLabel: String?
    var selectedIndexPath: IndexPath?
    
    let animationView = LottieAnimationView(name: "loading2")
    
    var home2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "img_home17.png")
        return imageView
    }()
    
    var exampleLabel: UILabel = {
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
    
    private let unfavoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_favoritesSelected")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(unfavoritesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_createDownload")
        button.setImage(image, for: .normal)
        // button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
        
        home2ImageView.image = favoriteImage
        exampleLabel.text = favoriteLabel
        applyAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        typeTextField.text = ""

        applyAnimation()
    }
    
    private func applyAnimation() {
        animationView.loopMode = .loop
        animationView.isHidden = true
    }
    
    private func addSubviews() {
        view.addSubview(home2ImageView)
        view.addSubview(regenerateButton)
        view.addSubview(exampleLabel)
        view.addSubview(unfavoritesButton)
        view.addSubview(saveButton)
        view.addSubview(backButton)
        view.addSubview(animationView)
    }
    
    private func applyConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalTo(home2ImageView.snp.top).offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            // width height!!!
        }
        
        home2ImageView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-90)
            //            make.bottom.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            
        }
        exampleLabel.snp.makeConstraints { make in
            make.top.equalTo(home2ImageView.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(40)
            make.left.equalTo(home2ImageView.snp.left)
        }
        
        regenerateButton.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        unfavoritesButton.snp.makeConstraints { make in
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
    
    @objc func backButtonTapped() {
        let vc = FavoritesVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .right)
        present(vc, animated: true)
    }
    
    @objc func regenerateButtonTapped() {
        animationView.isHidden = false
        animationView.play()
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
    
    @objc private func unfavoritesButtonTapped(_ sender: UIButton) {
        
        if unfavoritesButton.currentImage == UIImage(named: "btn_favoritesSelected") {
            unfavoritesButton.setImage(UIImage(named: "btn_favoritesUnselected"), for: .normal)
            
            // TODO: - CoreData Delete
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AIArtCreator")
            
//            let idString = idArray[selectedIndexPath!.row].uuidString
            
//            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "favoriteLabel") as? String {
                            
                            if let image = result.value(forKey: "favoriteImage") as? Data {
                                
                                context.delete(result)
                                favoriteImageArray.remove(at: selectedIndexPath!.row)
                                favoriteLabelArray.remove(at: selectedIndexPath!.row)
                                idArray.remove(at: selectedIndexPath!.row)
                                
                                do {
                                    try context.save()
                                    print("Data Deleted successfully")
                                    NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
                                } catch {
                                    print("error")
                                }
                                
                                break
                            }
                        }
                    }
                }
            } catch {
                print("error")
            }
        }
    }
    
}
