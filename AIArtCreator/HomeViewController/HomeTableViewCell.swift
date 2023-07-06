//
//  HomeTableViewCell.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 5.07.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: HomeTableViewCell.self)
    
    var isSelectedButton = false
    
     let homeTableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "btn_createFavorites.png")
        return imageView
    }()
    
     let homeTableLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 15)
        label.font = label.font.withSize(15)
        //        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let homeTableUseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Use", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.isUserInteractionEnabled = false
        button.addTarget(self, action: #selector(homeTableUseButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(homeTableImageView)
        contentView.addSubview(homeTableLabel)
        contentView.addSubview(homeTableUseButton)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        homeTableImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        homeTableLabel.snp.makeConstraints { make in
            make.left.equalTo(homeTableImageView.snp.right)
            make.centerY.equalToSuperview()
        }
        
        homeTableUseButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
        }
    }
    
    func setup(home: Home) {
        homeTableImageView.image = home.homeImage
        homeTableLabel.text = home.homeName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    @objc func homeTableUseButtonTapped(_ sender: UIButton){
        
//        guard let tableView = superview as? UITableView, let indexPath = tableView.indexPath(for: self) else {
//            return
//        }
//
//        for visibleCell in tableView.visibleCells {
//            guard let cell = visibleCell as? HomeTableViewCell else {
//                continue
//            }
//
//            if cell == self {
//                // Tıklanan butonun renk ve metin değişiklikleri
//                cell.isSelectedButton = true
//                cell.homeTableUseButton.backgroundColor = .black
//                cell.homeTableUseButton.setTitle("Using", for: .normal)
//                cell.homeTableUseButton.setTitleColor(.white, for: .normal)
//                print(cell.homeTableLabel.text)
//            } else {
//                // Diğer butonların eski haline dönmesi
//                cell.isSelectedButton = false
//                cell.homeTableUseButton.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
//                cell.homeTableUseButton.setTitle("Use", for: .normal)
//                cell.homeTableUseButton.setTitleColor(.black, for: .normal)
//            }
//        }
//
//        tableView.deselectRow(at: indexPath, animated: true)
    }
}









