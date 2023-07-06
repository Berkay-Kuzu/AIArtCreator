//
//  HomeViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var home: [Home] = []
    var selectedButtonIndexPath: IndexPath?
    var selectedButtonIndexes: Set<Int> = []
    
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
    
    private let typeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Type Something..."
        textField.textAlignment = .left
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
        dataConfig()
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        typeTextField.delegate = self
        
        homeTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
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
            make.right.equalToSuperview().offset(-10)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
            make.height.equalToSuperview().multipliedBy(0.06)
        }
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(selectACategoryLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(createButton.snp.top).offset(-10)
        }
    }
    
    @objc private func settingsButtonTapped(){
        //Settings screen will be opened!
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func selectFromExamplesButtonTapped(){
        
    }
    
    @objc private func createButtonTapped(){
        let vc = Home2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func dataConfig(){
        home = [
            Home(homeName: "Surrealist", homeImage: UIImage(named: "img_home")),
            Home(homeName: "Steampunk", homeImage: UIImage(named: "img_home2")),
            Home(homeName: "Rick and Morty", homeImage: UIImage(named: "img_home3")),
            Home(homeName: "Renaissance Painting", homeImage: UIImage(named: "img_home4")),
            Home(homeName: "Portrait Photo", homeImage: UIImage(named: "img_home5")),
            Home(homeName: "Pixelart", homeImage: UIImage(named: "img_home6")),
            Home(homeName: "Pencil Drawing", homeImage: UIImage(named: "img_home7")),
            Home(homeName: "Pastel", homeImage: UIImage(named: "img_home8")),
            Home(homeName: "Oil Painting", homeImage: UIImage(named: "img_home9")),
            Home(homeName: "Mystical", homeImage: UIImage(named: "img_home10")),
            Home(homeName: "Macrorealistic", homeImage: UIImage(named: "img_home11")),
            Home(homeName: "Lowpoly", homeImage: UIImage(named: "img_home12")),
            Home(homeName: "Longshot", homeImage: UIImage(named: "img_home13")),
            Home(homeName: "Gustavecourbet", homeImage: UIImage(named: "img_home14")),
            Home(homeName: "Digital Painting", homeImage: UIImage(named: "img_home15")),
            Home(homeName: "Cyberpunk", homeImage: UIImage(named: "img_home16")),
            Home(homeName: "Cinematic", homeImage: UIImage(named: "img_home17")),
            Home(homeName: "Anime", homeImage: UIImage(named: "img_home18")),
            Home(homeName: "Animation", homeImage: UIImage(named: "img_home19")),
            Home(homeName: "3D Render", homeImage: UIImage(named: "img_home20")),
            
        ]
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        cell.setup(home: home[indexPath.row])
        cell.selectionStyle = .none
        if selectedButtonIndexes.contains(indexPath.row) {
            cell.isSelectedButton = true
            cell.homeTableUseButton.backgroundColor = .black
            cell.homeTableUseButton.setTitle("Using", for: .normal)
            cell.homeTableUseButton.setTitleColor(.white, for: .normal)
            if let cellLabel = cell.homeTableLabel.text {
                print(cellLabel)
            }
        } else {
            cell.isSelectedButton = false
            cell.homeTableUseButton.backgroundColor = UIColor(red: 0.89, green: 0.65, blue: 0.24, alpha: 1.00)
            cell.homeTableUseButton.setTitle("Use", for: .normal)
            cell.homeTableUseButton.setTitleColor(.black, for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Seçilen hücrenin IndexPath'ini güncelle
        guard let cell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell else {
            return
        }
        
        if let selectedIndexPath = selectedButtonIndexPath {
            selectedButtonIndexes.remove(selectedIndexPath.row)
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
        
        if cell.isSelectedButton {
            cell.isSelectedButton = false
            selectedButtonIndexPath = nil
        } else {
            cell.isSelectedButton = true
            selectedButtonIndexPath = indexPath
            selectedButtonIndexes.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        typeTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
//        guard let city = searchTextField.text else {return}
//        weatherManager.fetchWeather(cityName: city)
    }
}
