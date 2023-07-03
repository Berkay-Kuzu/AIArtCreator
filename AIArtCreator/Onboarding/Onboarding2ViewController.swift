//
//  Onboarding2ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 3.07.2023.
//

import UIKit

class Onboarding2ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Select an Idea"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 25)
        label.font = label.font.withSize(25)
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
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
    }
    

}
