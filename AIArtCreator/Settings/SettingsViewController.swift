//
//  SettingsViewController.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 4.07.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settings: [Settings] = []
    
    private let settingsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .white
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .singleLine
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureNavBar()
        configData()
        addSubviews()
        applyConstraints()
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
    }
    private func addSubviews() {
        view.addSubview(settingsTableView)
    }
    
    private func applyConstraints() {
        settingsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configData() {
        settings = [
            Settings(name: "Try Premium"),
            Settings(name: "Privacy Policy"),
            Settings(name: "Terms of use"),
            Settings(name: "Restore Purchase"),
            Settings(name: "Rate Us"),
            Settings(name: "Send Feedback")
        ]
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = .black
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        //        cell.setup(settings[indexPath.row])
        cell.setup(settings: settings[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        let cellHeight = screenHeight * 0.08
        return cellHeight
    }
    
    
    
}
