//
//  UserDefaults+Extensions.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 10.07.2023.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
        case isPremium
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
    
    var isPremium: Bool {
        get {
            bool(forKey: UserDefaultsKeys.isPremium.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.isPremium.rawValue)
        }
    }
    
    
}
