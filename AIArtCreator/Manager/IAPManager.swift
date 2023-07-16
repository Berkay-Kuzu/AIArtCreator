//
//  IAPManager.swift
//  AIArtCreator
//
//  Created by Berkay Kuzu on 10.07.2023.
//

import StoreKit
import UIKit
import RevenueCat
import Lottie


class PurchaseManager {
    
    static let shared = PurchaseManager()
    
    var isUserPremium: Bool?
    
    var weeklyProductID = "com.berkaykuzu.AIArtCreator.premium"
    var annualProductID = "com.berkaykuzu.AIArtCreator.yearly"
    
    var packageWeekly: Package?
    var packageAnnual: Package?
    
    func configureRC() {
        
        Purchases.configure(withAPIKey: "appl_vOEOLVrGtEYpDlnDZzZKijYemBc", appUserID: "berkay3")
        Purchases.logLevel = .verbose
        
        downPackages()
    }
    
    func downPackages() {
        Purchases.shared.getOfferings { [self] offerings, _ in
            
            if let offerings = offerings {
                let offer = offerings.current
                let packages = offer?.availablePackages
                guard packages != nil else {
                    return
                }
                
                for package in packages! {
                    
                    let product = package.storeProduct
                    let productPrice = product.price
                    switch product.productIdentifier {
                    case self.weeklyProductID:
                        packageWeekly = package
                        NotificationCenter.default.post(name: Notification.Name("prices"), object: nil)
                    case self.annualProductID:
                        packageAnnual = package
                        NotificationCenter.default.post(name: Notification.Name("prices"), object: nil)
                    default:
                        return
                    }
                }
            }
        }
    }
    
    func purchasePackage(package: Package?, vc: UIViewController, completionSuccess: (() -> ())?, completionFailure: (() -> ())?) {

        let packageIdentifier = package!.storeProduct.productIdentifier
        
        Purchases.shared.purchase(package: package!) { [self] transaction, purchaserInfo, _, _ in
          
            if purchaserInfo?.entitlements.all["Premium"]?.isActive == true {
                isUserPremium = true
                UserDefaults.standard.set(isUserPremium, forKey: "isUserPremium")
                guard let completionSuccess else { return }
                completionSuccess()
                paymentControl = true
            } else {
                paymentControl = false

                guard let completionFailure else { return }
                completionFailure()
            }
        }
    }
        
    func restorePurchases(vc: UIViewController, completionSuccess: (() -> ())?, completionFailure: (() -> ())?) {
        Purchases.shared.restorePurchases { [self] purchaserInfo, _ in
            if purchaserInfo?.entitlements.all["Premium"]?.isActive == true {
                isUserPremium = true
                UserDefaults.standard.set(isUserPremium, forKey: "isUserPremium")
                guard let completionSuccess = completionSuccess else { return }
                completionSuccess()
            } else {
                guard let completionFailure = completionFailure else { return }
                completionFailure()
            }
        }
    }

    
    func verifySubscription(completionSuccess: (() -> ())?, completionFailure: (() -> ())?) {

        Purchases.shared.getCustomerInfo { [self] purchaserInfo, _ in
            if purchaserInfo?.entitlements.all["Premium"]?.isActive == true {
                isUserPremium = true
                paymentControl = true
                UserDefaults.standard.set(isUserPremium, forKey: "isUserPremium")
                guard let completionSuccess else { return }
                completionSuccess()
            } else {
                isUserPremium = false
                paymentControl = false
                UserDefaults.standard.set(isUserPremium, forKey: "isUserPremium")
                guard let completionFailure else { return }
                completionFailure()
            }
        }
    }
}
