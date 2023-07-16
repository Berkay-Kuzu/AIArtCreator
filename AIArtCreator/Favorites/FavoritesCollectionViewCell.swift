//
//  FavoritesCollectionViewCell.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 11.07.2023.
// img_favorites4

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: FavoritesCollectionViewCell.self)
    
     let favoriteCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.text = "Text"
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
     let favoriteCellImageView: UIImageView = {
        let imageView = UIImageView()
         imageView.contentMode = .scaleToFill
        //imageView.backgroundColor = .yellow
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let favoriteBottomCellImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "img_favorites4")
       //imageView.backgroundColor = .yellow
       imageView.layer.cornerRadius = 10
       imageView.clipsToBounds = true
       return imageView
   }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentview()
        applyConstraints()
//        configureBackgroundImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContentview() {
        contentView.addSubview(favoriteCellImageView)
        contentView.addSubview(favoriteCellLabel)
        contentView.addSubview(favoriteBottomCellImageView)
        
    }
    
    func applyConstraints() {
        favoriteCellImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        favoriteCellLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }
        favoriteBottomCellImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    
    private func configureBackgroundImage() {
        let backgroundImage = UIImage(named: "img_favorites4")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.frame = contentView.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        contentView.addSubview(backgroundImageView)
        contentView.sendSubviewToBack(backgroundImageView)
    }
    
}
