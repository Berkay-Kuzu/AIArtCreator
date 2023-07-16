//
//  HomeTableViewCell.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 5.07.2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: HomeTableViewCell.self)
    
     let homeTableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "btn_createFavorites.png")
        return imageView
    }()
    
     let homeTableLabel: UILabel = {
        let label = UILabel()
//        label.text = "Welcome to"
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
        button.isUserInteractionEnabled = true
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    @objc func homeTableUseButtonTapped(_ sender: UIButton){
   
        let indexPath = IndexPath(row: sender.tag, section: 0)
        selectedTableViewData = tableViewDataArray[indexPath.row]
        print(selectedTableViewData.tableViewDataName)
        print("Use Button Clicked")
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)

    }
}









