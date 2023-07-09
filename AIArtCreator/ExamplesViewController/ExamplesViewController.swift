//
//  ExamplesViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 8.07.2023.
//

import UIKit
import SnapKit

class ExamplesViewController: UIViewController {
    
    let items = tableViewDataArray.count // Koleksiyondaki toplam öğe sayısı
    
    var selectedCellText: String?
    
    private let exampleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example Ideas"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 25)
        label.font = label.font.withSize(25)
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    let examplesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //        layout.minimumLineSpacing = 0
        //        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.refreshControl?.isContextMenuInteractionEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        //        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    private let applyExampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apply Example", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(applyExampleButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        
        
        examplesCollectionView.delegate = self
        examplesCollectionView.dataSource = self
        
        examplesCollectionView.register(ExamplesCollectionViewCell.self, forCellWithReuseIdentifier: ExamplesCollectionViewCell.identifier)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: NSNotification.Name("reload"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedCollectionViewData = ExamplesCollectionViewData()
        reloadCollectionView()
        
    }
    
    @objc private func reloadCollectionView(){
        examplesCollectionView.reloadData()
    }
    
    private func addSubviews() {
        view.addSubview(examplesCollectionView)
        view.addSubview(exampleLabel)
        view.addSubview(applyExampleButton)
    }
    
    private func applyConstraints() {
        
        exampleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
        
        examplesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
        }
        applyExampleButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalToSuperview().multipliedBy(0.06)
        }
    }
    
    @objc private func applyExampleButtonClicked() {
        guard let selectedText = selectedCellText else { return }
            
            // HomeViewController'a geçiş yapmadan önce
            // HomeViewController'ın örneğini oluşturun
            let homeVC = HomeViewController()
            homeVC.textToDisplay = selectedText
            
            // HomeViewController'ı push edin
            navigationController?.pushViewController(homeVC, animated: true)
    }
    
}

extension ExamplesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let groupCount = items / 4
        let remainingItems = items % 4
        
        if remainingItems == 0 {
            return groupCount * 4
        } else {
            return groupCount * 4 + min(remainingItems, 2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExamplesCollectionViewCell.identifier, for: indexPath) as? ExamplesCollectionViewCell else { return UICollectionViewCell() }
        
        cell.exampleNameLabel.text = collectionViewDataArray[indexPath.row].examplesCollectionViewDataName
        cell.exampleNameLabel.textColor = UIColor(red: 0.42, green: 0.39, blue: 0.39, alpha: 1.00)
        cell.exampleNameLabel.font = .systemFont(ofSize: 15)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        //        cell.isSelected = true
        cell.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        //        cell.tag = indexPath.row
        
        
        if collectionViewDataArray[indexPath.row].examplesCollectionViewDataName == selectedCollectionViewData.examplesCollectionViewDataName {
            cell.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
            cell.exampleNameLabel.textColor = .black
            cell.exampleNameLabel.font = .boldSystemFont(ofSize: 15)
            
        } else {
            cell.exampleNameLabel.textColor = UIColor(red: 0.42, green: 0.39, blue: 0.39, alpha: 1.00)
            cell.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth: CGFloat
        let itemHeight: CGFloat
        
        let patternCount = 4 // Desenin tekrar sayısı
        
        if indexPath.row % patternCount < 2 {
            // İlk satır veya sonraki iki satır
            itemWidth = (screenWidth - 20) / 2
            itemHeight = screenWidth * 0.1
        } else {
            // Diğer satırlar
            itemWidth = screenWidth - 20
            itemHeight = screenWidth * 0.1
        }
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedCellText = collectionViewDataArray[indexPath.row].examplesCollectionViewDataName
        print(selectedCellText)
        
        selectedCollectionViewData = collectionViewDataArray[indexPath.row]
//        print(selectedCollectionViewData.examplesCollectionViewDataName as Any)
        print("Collection View Cell Clicked")
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
        
    }
    
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
