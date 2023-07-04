//
//  Onboarding3ViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit
import Lottie

class Onboarding3ViewController: UIViewController {
    
    private let onboarding3TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Creating Your Image"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 20)
        label.font = label.font.withSize(20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let lottieAnimationView: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "loading")
        animationView.contentMode = .scaleAspectFit
        //animationView.animationSpeed = 1
        animationView.loopMode = .loop
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        addSubviews()
        applyConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lottieAnimationView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.lottieAnimationView.stop()
            self.lottieAnimationView.removeFromSuperview()
            let vc = Onboarding4ViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func addSubviews(){
        view.addSubview(lottieAnimationView)
        view.addSubview(onboarding3TitleLabel)
    }
    
    private func applyConstraints(){
        
        lottieAnimationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        onboarding3TitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(lottieAnimationView.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }
    }
    
}
