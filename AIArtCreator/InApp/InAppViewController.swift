//
//  InAppViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit

class InAppViewController: UIViewController {
    
    private let crossButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(red: 0.04, green: 0.04, blue: 0.04, alpha: 1.00)
        let image = UIImage(named: "btn_cross")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(crossButtonTapped), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let explorePremiumLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore PREMIUM"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 30)
        label.font = label.font.withSize(30)
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let unleashLabel: UILabel = {
        let label = UILabel()
        label.text = "Unleash your creativity with PRO experience"
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
        label.font = UIFont(name: "Inter", size: 15)
        label.font = label.font.withSize(15)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let inAppStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
       
        return stackView
    }()
    
    private let inAppStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
//        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let inAppStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
//        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let inAppStackViewAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let fastProcessingLabel: UILabel = {
        let label = UILabel()
        label.text = "Fast processing"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 16)
        label.font = label.font.withSize(16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let artworkCreationLabel: UILabel = {
        let label = UILabel()
        label.text = "Unlimited artwork creation"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 16)
        label.font = label.font.withSize(16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let getMultipleLabel: UILabel = {
        let label = UILabel()
        label.text = "Get multiple results"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 16)
        label.font = label.font.withSize(16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let checkCircleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "check-circle.png")
        return imageView
    }()
    
    private let checkCircleImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "check-circle.png")
        return imageView
    }()
    
    private let checkCircleImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "check-circle.png")
        return imageView
    }()
    
    private let weeklyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        button.addTarget(self, action: #selector(weeklyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let yearlyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        button.addTarget(self, action: #selector(yearlyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let daysFreeTrialLabel: UILabel = {
        let label = UILabel()
        label.text = "3 Days Free Trial"
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00)
        label.font = UIFont(name: "Inter", size: 13)
        label.font = label.font.withSize(13)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let weeklyPlanLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly Plan"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 14)
        label.font = label.font.withSize(14)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let dolarLabel: UILabel = {
        let label = UILabel()
        label.text = "$3.99 "
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 15)
        label.font = label.font.withSize(15)
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let yearlyPlanLabel: UILabel = {
        let label = UILabel()
        label.text = "Yearly Plan"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 14)
        label.font = label.font.withSize(14)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let dolarLabel2: UILabel = {
        let label = UILabel()
        label.text = "$29.99 "
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 15)
        label.font = label.font.withSize(15)
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let termOfUseLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00)
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins", size: 11)
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.attributedText = NSAttributedString(string: "Term of Use", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let restorePurchasesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00)
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins", size: 11)
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.attributedText = NSAttributedString(string: "Restore Purchases", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    private let privacyPolicyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00)
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins", size: 11)
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.attributedText = NSAttributedString(string: "Privacy Policy", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        configureNavBar()
        addStackViews()
        configureBackgroundImage()
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(termOfUseLabelTapped))
        termOfUseLabel.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(termOfUseLabelTapped))
        privacyPolicyLabel.addGestureRecognizer(tapGesture2)
        
    }
    
    @objc private func termOfUseLabelTapped() {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    private func addSubviews() {
        view.addSubview(crossButton) //, with this way, the button is working!
       // inAppImageView.addSubview(crossButton) In this way, the button is not working!
        view.addSubview(explorePremiumLabel)
        view.addSubview(unleashLabel)
        view.addSubview(inAppStackView)
        view.addSubview(fastProcessingLabel)
        view.addSubview(checkCircleImageView)
        view.addSubview(inAppStackView2)
        view.addSubview(artworkCreationLabel)
        view.addSubview(inAppStackView3)
        view.addSubview(getMultipleLabel)
        view.addSubview(checkCircleImageView2)
        view.addSubview(checkCircleImageView3)
        view.addSubview(weeklyButton)
        view.addSubview(daysFreeTrialLabel)
        view.addSubview(weeklyPlanLabel)
        view.addSubview(dolarLabel)
        view.addSubview(yearlyPlanLabel)
        view.addSubview(dolarLabel2)
        weeklyButton.addSubview(daysFreeTrialLabel)
        weeklyButton.addSubview(weeklyPlanLabel)
        weeklyButton.addSubview(dolarLabel)
        view.addSubview(yearlyButton)
        yearlyButton.addSubview(yearlyPlanLabel)
        yearlyButton.addSubview(dolarLabel2)
        view.addSubview(startButton)
        view.addSubview(termOfUseLabel)
        view.addSubview(restorePurchasesLabel)
        view.addSubview(privacyPolicyLabel)
        view.addSubview(inAppStackViewAll)
    
    }
    
    private func addStackViews() {
        inAppStackView.addArrangedSubview(checkCircleImageView)
        inAppStackView.addArrangedSubview(fastProcessingLabel)
        inAppStackView2.addArrangedSubview(checkCircleImageView2)
        inAppStackView2.addArrangedSubview(artworkCreationLabel)
        inAppStackView3.addArrangedSubview(checkCircleImageView3)
        inAppStackView3.addArrangedSubview(getMultipleLabel)
        inAppStackViewAll.addArrangedSubview(inAppStackView)
        inAppStackViewAll.addArrangedSubview(inAppStackView2)
        inAppStackViewAll.addArrangedSubview(inAppStackView3)
        
    }
    
    private func applyConstraints(){
        
        crossButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(40)
            make.right.equalToSuperview().offset(-10)
        }
        
        explorePremiumLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-90)
            make.centerX.equalToSuperview()
        }
        unleashLabel.snp.makeConstraints { make in
            make.top.equalTo(explorePremiumLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        inAppStackViewAll.snp.makeConstraints { make in
            make.bottom.equalTo(weeklyButton.snp.top).offset(-40)
            make.centerX.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.15)
//            make.width.equalToSuperview().multipliedBy(0.6)
        }

        weeklyButton.snp.makeConstraints { make in
            make.bottom.equalTo(yearlyButton.snp.top).offset(-20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.07)
        }
        daysFreeTrialLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(15)
        }
        weeklyPlanLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(15)
        }
        dolarLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
        yearlyButton.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.07)
        }
        yearlyPlanLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        dolarLabel2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            //            make.height.equalTo(50)
            make.height.equalToSuperview().multipliedBy(0.06)
            //            make.centerX.equalToSuperview()
        }
        termOfUseLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.left.equalToSuperview().offset(20)
        }
        restorePurchasesLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.centerX.equalToSuperview()
        }
        privacyPolicyLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.crossButton.alpha = 0.0
            self.crossButton.isHidden = false
            
            UIView.animate(withDuration: 1.0) {
                self.crossButton.alpha = 1.0
            }
        }
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        //        navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationController?.navigationItem.largeTitleDisplayMode = .always
        //        navigationController?.navigationBar.tintColor = .black
    }
    
    private func configureBackgroundImage() {
        let backgroundImage = UIImage(named: "Inapp")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @objc private func crossButtonTapped(){
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func weeklyButtonTapped() {
        print("WeeklyButtonTapped")
    }
    
    @objc private func yearlyButtonTapped() {
        print("YearlyButtonTapped")
    }
    
    @objc private func startButtonTapped() {
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
