//
//  HomeViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit
import Lottie
import Hero

class HomeVC: UIViewController {
    
    var home: [Home] = []
    
    let animationView = LottieAnimationView(name: "loading")
    
    var textToDisplay: String?
    
    private let homeTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .white
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    private let exploreLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 25)
        label.font = label.font.withSize(25)
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let loremIpsumLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 25)
        label.font = label.font.withSize(25)
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let enterPromptLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Prompt"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 18)
        label.font = label.font.withSize(18)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_settings")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        let image = UIImage(named: "btn_favoritesUnselected")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let selectFromExamplesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select From Examples >", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(selectFromExamplesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let typeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Type Something..."
        textField.textAlignment = .left
        textField.clearButtonMode = .whileEditing
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        //        textField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let selectACategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a Category"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Inter", size: 18)
        label.font = label.font.withSize(18)
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        closeKeyboard()
        configureNavBar()
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        typeTextField.delegate = self
        
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadtableViewView), name: NSNotification.Name("reload"), object: nil)
        
        applyAnimation()
        
        typeTextField.text = textToDisplay
        
//        if paymentControl == false {
//            let vc = InAppViewController()
//            vc.hero.isEnabled = true
//            vc.modalPresentationStyle = .fullScreen
//            vc.heroModalAnimationType = .slide(direction: .up)
//            self.present(vc, animated: true)
//        }else{
//            let vc = HomeViewController()
//            self.present(vc, animated: true)
//
//        }
        
        //        if (UserDefaults.standard.bool(forKey: "isUserPremium")) {
        //            let vc = InAppViewController()
        //            vc.hero.isEnabled = true
        //            vc.modalPresentationStyle = .fullScreen
        //            vc.heroModalAnimationType = .slide(direction: .up)
        //            self.present(vc, animated: true)
        //        } else {
        //
        //        }
        
        
        //        let vc = InAppViewController()
        //        vc.hero.isEnabled = true
        //        vc.modalPresentationStyle = .fullScreen
        //        vc.heroModalAnimationType = .slide(direction: .up)
        //        self.present(vc, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedTableViewData = TableViewData()
        //        typeTextField.text = ""
        reloadtableViewView()
        applyAnimation()
        
    }
    
    private func applyAnimation() {
        animationView.loopMode = .loop
        animationView.isHidden = true
        //        animationView.backgroundColor = .white
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func closeKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    private func addSubviews(){
        view.addSubview(exploreLabel)
        view.addSubview(loremIpsumLabel)
        view.addSubview(settingsButton)
        view.addSubview(enterPromptLabel)
        view.addSubview(typeTextField)
        view.addSubview(selectFromExamplesButton)
        view.addSubview(selectACategoryLabel)
        view.addSubview(createButton)
        view.addSubview(homeTableView)
        view.addSubview(animationView)
        view.addSubview(favoriteButton)
    }
    
    private func applyConstraints(){
        exploreLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(20)
        }
        loremIpsumLabel.snp.makeConstraints { make in
            make.top.equalTo(exploreLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().offset(-5)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(settingsButton.snp.left).offset(-20)
        }
        enterPromptLabel.snp.makeConstraints { make in
            make.top.equalTo(loremIpsumLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        typeTextField.snp.makeConstraints { make in
            make.top.equalTo(enterPromptLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalToSuperview().multipliedBy(0.055)
        }
        selectFromExamplesButton.snp.makeConstraints { make in
            make.top.equalTo(typeTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.04)
            make.width.equalToSuperview().multipliedBy(0.59)
        }
        selectACategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(selectFromExamplesButton.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        createButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalToSuperview().multipliedBy(0.06)
        }
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(selectACategoryLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(createButton.snp.top).offset(-10)
        }
        animationView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5) // Genişlik, ekran genişliğinin yarısı
            make.height.equalTo(animationView.snp.width)
            make.center.equalToSuperview()
        }
    }
    
    @objc private func settingsButtonTapped(){
        
        let vc = SettingsVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .left)
        present(vc, animated: true)
//        dismiss(animated: true)
        
    }
    @objc func reloadtableViewView() {
        homeTableView.reloadData()
    }
    
    @objc private func selectFromExamplesButtonTapped(){
        
        let vc = ExamplesVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .left)
        self.present(vc, animated: true)
    }
    
    @objc private func createButtonTapped(_ sender: UIButton){
        animationView.isHidden = false
        animationView.play()
        fetchData()
        
    }
    
    @objc private func favoriteButtonTapped() {
        
        let vc = FavoritesVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.heroModalAnimationType = .slide(direction: .left)
        present(vc, animated: true)
        
    }
    
    func fetchData() {
        let creator = Creator(prompt: typeTextField.text, style: selectedTableViewData.tableViewDataName )
        NetworkManager.shared.fetchImageFromAPI(creator: creator) { [weak self] resultImg in
            creator.resultImg = resultImg
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                self.animationView.stop()
                let vc = Home2VC()
                vc.hero.isEnabled = true
                vc.modalPresentationStyle = .fullScreen
                vc.heroModalAnimationType = .slide(direction: .left)
                vc.fetch = creator // bu sayede farklı ekranlar arasında veri aktarımı yaptık!!!
                vc.exampleLabel.text = self.typeTextField.text
                self.present(vc, animated: true)
                
            }
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        
        cell.homeTableImageView.image = tableViewDataArray[indexPath.row].tableViewDataImage
        
        cell.homeTableLabel.text = tableViewDataArray[indexPath.row].tableViewDataName
        cell.homeTableUseButton.tag = indexPath.row
        
        cell.selectionStyle = .none
        
        if tableViewDataArray[indexPath.row].tableViewDataName == selectedTableViewData.tableViewDataName {
            cell.homeTableUseButton.backgroundColor = .black
            cell.homeTableUseButton.setTitle("Using", for: .normal)
            cell.homeTableUseButton.setTitleColor(.white, for: .normal)
            
        } else {
            cell.homeTableUseButton.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
            cell.homeTableUseButton.setTitle("Use", for: .normal)
            cell.homeTableUseButton.setTitleColor(.black, for: .normal)
        }
        return cell
    }
    
}

extension HomeVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        typeTextField.endEditing(true)
        return true
    }
    
}
