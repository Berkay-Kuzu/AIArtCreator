//
//  SettingsModel.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 12.07.2023.
//

import Foundation

class PremiumSettingsModel {
    
    var settingsName = String()
    
    init(settingsName: String = String()) {
        self.settingsName = settingsName
    }
}

var premiumSettingsArray = [
    settingsModel(settingsName: "Privacy Policy"),
    settingsModel(settingsName: "Terms of Use"),
    settingsModel(settingsName: "Restore Purchase"),
    settingsModel(settingsName: "Rate Us"),
    settingsModel(settingsName: "Send Feedback"),
]

//let premiumArray = premiumSettingsArray

class settingsModel {
    
    var settingsName = String()
    
    init(settingsName: String = String()) {
        self.settingsName = settingsName
    }
}

var defaultSettingsArray = [
    settingsModel(settingsName: "Try Premium"),
    settingsModel(settingsName: "Privacy Policy"),
    settingsModel(settingsName: "Terms of Use"),
    settingsModel(settingsName: "Restore Purchase"),
    settingsModel(settingsName: "Rate Us"),
    settingsModel(settingsName: "Send Feedback"),
]
