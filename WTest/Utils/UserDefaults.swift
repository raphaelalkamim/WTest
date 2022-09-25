//
//  UserDefaults.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//

import Foundation
import UIKit

public class Utils {
    static let shared: Utils = Utils()
    weak var dataManager = DataManager.shared
    var data: [PostalCodeCSV] = []
    let url: String = "codigos_postais/master/data/codigos_postais.csv"
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "firstLaunched") {
            return true
        } else {
            defaults.set(true, forKey: "firstLaunched")
            downloadCSV()
            return false
        }
    }
    
    func downloadCSV() {
        Task.detached {
            do {
                guard let dataNew = try await self.dataManager?.loadCSV(url: self.url) else {return}
                self.data = dataNew
                
                print(self.data.count)
                print(PostalCodeRepository.shared.getPostalCode().count)
            } catch {
                print("errorOccurred")
            }
        }
    }
    
    func saveLocaly() {
        for postalCodeValue in self.data {
            _ = PostalCodeRepository.shared.createPostalCode(postalCode: postalCodeValue)
            PostalCodeRepository.shared.saveContext()
        }
        
        print(self.data)
        print(PostalCodeRepository.shared.getPostalCode().count)
    }
    
}
