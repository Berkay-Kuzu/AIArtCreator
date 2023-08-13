//
//  SettingsViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit
import SnapKit
import StoreKit
import MessageUI

class SettingsVC: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    
    //    var settings: [Settings] = []
    
    //    private let settingsBackButton: UIButton = {
    //        let button = UIButton(type: .system)
    //        button.tintColor = UIColor.black
    //        let image = UIImage(named: "btn_back")
    //        button.setImage(image, for: .normal)
    //        button.addTarget(self, action: #selector(settingsBackButtonTapped), for: .touchUpInside)
    //        return button
    //    }()
    
    //    private let settingsTableView: UITableView = {
    //        let table = UITableView(frame: .zero, style: .insetGrouped)
    //        table.backgroundColor = .white
    //        table.showsVerticalScrollIndicator = false
    //        table.separatorStyle = .singleLine
    //        return table
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupUI()
        //        configureNavBar()
        //        addSubviews()
        //        applyConstraints()
        //
        //        settingsTableView.dataSource = self
        //        settingsTableView.delegate = self
        //
        //        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
    }

    private func setupUI() {
        let settingsBackButton = UIButton(type: .system)
        settingsBackButton.tintColor = UIColor.black
        let image = UIImage(named: "btn_back")
        settingsBackButton.setImage(image, for: .normal)
        settingsBackButton.addTarget(self, action: #selector(settingsBackButtonTapped), for: .touchUpInside)
        view.addSubview(settingsBackButton)
        settingsBackButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        let settingsLabel = UILabel()
        settingsLabel.text = "Settings"
        settingsLabel.textColor = UIColor.black
        settingsLabel.font = UIFont(name: "Inter", size: 25)
        settingsLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        settingsLabel.textAlignment = .center
        view.addSubview(settingsLabel)
        settingsLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
        
        let tryPremiumButton = SettingsButton(title: "Try Premium")
        view.addSubview(tryPremiumButton)
        tryPremiumButton.addTarget(self, action: #selector(tryPremiumButtonTapped), for: .touchUpInside)
        tryPremiumButton.snp.makeConstraints { make in
            make.top.equalTo(settingsLabel.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        let privacyPolicyButton = SettingsButton(title: "Privacy Policy")
        view.addSubview(privacyPolicyButton)
        privacyPolicyButton.addTarget(self, action: #selector(privacyPolicyButtonTapped), for: .touchUpInside)
        privacyPolicyButton.snp.makeConstraints { make in
            make.top.equalTo(tryPremiumButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        let termsOfUseButton = SettingsButton(title: "Terms of Use")
        view.addSubview(termsOfUseButton)
        termsOfUseButton.addTarget(self, action: #selector(termsOfUseButtonTapped), for: .touchUpInside)
        termsOfUseButton.snp.makeConstraints { make in
            make.top.equalTo(privacyPolicyButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        let restorePurchaseButton = SettingsButton(title: "Restore Purchase")
        view.addSubview(restorePurchaseButton)
        restorePurchaseButton.addTarget(self, action: #selector(restorePurchaseButtonTapped), for: .touchUpInside)
        restorePurchaseButton.snp.makeConstraints { make in
            make.top.equalTo(termsOfUseButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        let rateUsButton = SettingsButton(title: "Rate Us")
        view.addSubview(rateUsButton)
        rateUsButton.addTarget(self, action: #selector(rateUsButtonTapped), for: .touchUpInside)
        rateUsButton.snp.makeConstraints { make in
            make.top.equalTo(restorePurchaseButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        let sendFeedbackButton = SettingsButton(title: "Send Feedback")
        view.addSubview(sendFeedbackButton)
        sendFeedbackButton.addTarget(self, action: #selector(sendFeedbackButtonTapped), for: .touchUpInside)
        sendFeedbackButton.snp.makeConstraints { make in
            make.top.equalTo(rateUsButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        if paymentControl == true {
            DispatchQueue.main.async {
                tryPremiumButton.isHidden = true
                privacyPolicyButton.snp.remakeConstraints { make in
                    make.top.equalTo(settingsLabel.snp.bottom).offset(20)
                    make.left.equalToSuperview().offset(10)
                    make.right.equalToSuperview().offset(-10)
                }
            }
           
        } else {
            DispatchQueue.main.async {
                tryPremiumButton.isHidden = false
                
            }
        }
        
    }
    
    @objc func settingsBackButtonTapped() {
        let vc = HomeVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .right)
        present(vc, animated: true)
    }
    
    @objc func tryPremiumButtonTapped() {
        let vc = InAppVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .right)
        present(vc, animated: true)
    }
    
    @objc func privacyPolicyButtonTapped() {
        guard let url = URL(string: "https://www.google.com") else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func termsOfUseButtonTapped() {
        guard let url = URL(string: "https://www.google.com") else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func restorePurchaseButtonTapped() {
        let vc = InAppVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .right)
        present(vc, animated: true)
    }
    
    @objc func rateUsButtonTapped() {
        let appID = "6451086999"
        if let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review") {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func sendFeedbackButtonTapped() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["support@neonapps.co"])
            mail.setMessageBody("<p>About AIArtCreator App</p>", isHTML: true)
            present(mail, animated: true)
        } else {
            let alert = UIAlertController(title: "Error!", message: "Feedback could not be sent!", preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(alertAct)
            present(alert, animated: true)
        }
    }
    
   
}


//    private func addSubviews() {
////        view.addSubview(settingsTableView)
//        view.addSubview(settingsBackButton)
//    }

//    private func applyConstraints() {
////        settingsTableView.snp.makeConstraints { make in
////            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
////            make.left.right.bottom.equalToSuperview()
////        }
//
//        settingsBackButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.left.equalToSuperview().offset(10)
//        }
//    }

//    private func configureNavBar() {
//        navigationController?.isNavigationBarHidden = false
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
//        title = "Settings"
//        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationController?.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.navigationBar.tintColor = .black
//    }



//extension SettingsViewController: UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if paymentControl == true {
//            return premiumSettingsArray.count
//        } else {
//            return defaultSettingsArray.count
//
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
//        if paymentControl == true {
//            cell.settingsLabel.text = premiumSettingsArray[indexPath.row].settingsName
//            cell.settingsLabel.textColor = .black
//            cell.backgroundColor = .white
//        } else {
//            cell.settingsLabel.text = defaultSettingsArray[indexPath.row].settingsName
//            cell.settingsLabel.textColor = .black
//            cell.backgroundColor = .white
//
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let screenHeight = UIScreen.main.bounds.height
//        let cellHeight = screenHeight * 0.08
//        return cellHeight
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectIndex = indexPath.row
//
//        if paymentControl == true {
//            if selectIndex == 0 {
//                guard let url = URL(string: "https://www.google.com") else {
//                    return
//                }
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//            if selectIndex == 1 {
//                guard let url = URL(string: "https://www.google.com") else {
//                    return
//                }
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//            if selectIndex == 2 {
//                let vc = InAppViewController()
//                vc.hero.isEnabled = true
//                vc.modalPresentationStyle = .fullScreen
//                vc.heroModalAnimationType = .slide(direction: .right)
//                present(vc, animated: true)
//            }
//            if selectIndex == 3 {
//                let appID = "6451086999"
//                if let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review") {
//                     UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
//                }
//            }
//            if selectIndex == 4 {
//                if MFMailComposeViewController.canSendMail() {
//                               let mail = MFMailComposeViewController()
//                               mail.mailComposeDelegate = self
//                               mail.setToRecipients(["support@neonapps.co"])
//                               mail.setMessageBody("<p>About AIArtCreator App</p>", isHTML: true)
//
//                               present(mail, animated: true)
//                           } else {
//                    let alert = UIAlertController(title: "Error", message: "Mail could not be found!", preferredStyle: .alert)
//                    let alertAct = UIAlertAction(title: "OK", style: .cancel)
//                    alert.addAction(alertAct)
//                    present(alert, animated: true)
//                }
//            }
//        }
//
//        if paymentControl == false {
//            if selectIndex == 0 {
//                let vc = InAppViewController()
//                vc.hero.isEnabled = true
//                vc.modalPresentationStyle = .fullScreen
//                vc.heroModalAnimationType = .slide(direction: .left)
//                present(vc, animated: true)
//            }
//            if selectIndex == 1 {
//                guard let url = URL(string: "https://www.google.com") else {
//                    return
//                }
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//
//            }
//            if selectIndex == 2 {
//                guard let url = URL(string: "https://www.google.com") else {
//                    return
//                }
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//            if selectIndex == 3 {
//
//            }
//            if selectIndex == 4 {
//                let appID = "6451086999"
//                if let appStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)?action=write-review") {
//                     UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
//                }
//            }
//            if selectIndex == 5 {
//                if MFMailComposeViewController.canSendMail() {
//                               let mail = MFMailComposeViewController()
//                               mail.mailComposeDelegate = self
//                               mail.setToRecipients(["support@neonapps.co"])
//                               mail.setMessageBody("<p>About AIArtCreator App</p>", isHTML: true)
//
//                               present(mail, animated: true)
//                           } else {
//                    let alert = UIAlertController(title: "Error", message: "Mail could not be found!", preferredStyle: .alert)
//                    let alertAct = UIAlertAction(title: "OK", style: .cancel)
//                    alert.addAction(alertAct)
//                    present(alert, animated: true)
//                }
//            }
//        }
//    }
//}
