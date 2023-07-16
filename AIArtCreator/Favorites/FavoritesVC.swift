//
//  FavoritesViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 11.07.2023.
//

import UIKit
import CoreData
import Hero

var favoriteImageArray = [UIImage]()
var favoriteLabelArray = [String]()
var idArray = [UUID()]

class FavoritesVC: UIViewController {

//    let screenHeight = UIScreen.main.bounds.height
//    let screenWidth = UIScreen.main.bounds.width
   
    lazy var favoriteCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.minimumLineSpacing = 20
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.collectionViewLayout = flowlayout
        collectionView.isPagingEnabled = true
        collectionView.refreshControl?.isContextMenuInteractionEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let favoritesBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_back")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(favoritesBackButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorites"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 25)
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        getDataFromCoreData()
        
        
        
        favoriteCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritesCollectionViewCell.identifier)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: NSNotification.Name("reload"), object: nil)
    }
    
    @objc func favoritesBackButtonTapped() {
        let vc = HomeVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .right)
        present(vc, animated: true)
    }
    
    @objc func reloadCollectionView() {
        favoriteCollectionView.reloadData()
    }
    
    private func addSubviews(){
        view.addSubview(favoriteCollectionView)
        view.addSubview(titleLabel)
        view.addSubview(favoritesBackButton)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
        favoritesBackButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(20)
        }
        favoriteCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func getDataFromCoreData(){
        favoriteLabelArray.removeAll(keepingCapacity: false)
        favoriteImageArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AIArtCreator")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(fetchRequest)
            print("Data Fetched successfully")
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let image = result.value(forKey: "favoriteImage") as? Data {
                        guard let favoriteImages = UIImage(data: image) else { return  }
                        favoriteImageArray.append(favoriteImages)
                    }
                    if let favoriteLabel = result.value(forKey: "favoriteLabel") as? String {
                        favoriteLabelArray.append(favoriteLabel)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        idArray.append(id)
                      
                    }
                    
                    self.favoriteCollectionView.reloadData()
                }
            }
        }
        catch {
           print("There is an error concerning fetching data")
        }
    }
    
}

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteLabelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.identifier, for: indexPath) as! FavoritesCollectionViewCell
        cell.backgroundColor = .systemYellow
        cell.layer.cornerRadius = 10
        cell.favoriteCellImageView.image = favoriteImageArray[indexPath.row]
        cell.favoriteCellLabel.text = favoriteLabelArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = collectionView.bounds.width
        return CGSize(width: width * 0.43, height: height * 0.24)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedIndexPath = indexPath

        let detailViewController = FavoritesDetailVC()
        
        detailViewController.favoriteImage = favoriteImageArray[indexPath.row]
        detailViewController.favoriteLabel = favoriteLabelArray[indexPath.row]
        detailViewController.selectedIndexPath = selectedIndexPath
        
        let vc = detailViewController
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .left)
        present(vc, animated: true)
                
   
    }
    
}
