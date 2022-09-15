//
//  UserDefaultsManager.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

class UserDefaultsManager {
    private let userDefaults = UserDefaults.standard
    private let userDefaultsKey = "searchedKeywords"
    
    func addData(searchedWord: String) {
        var searchedKeywords = getData()
        
        if(searchedKeywords.count == 5) {
            searchedKeywords.removeFirst()
        }
        
        searchedKeywords.append(searchedWord)
        userDefaults.set(searchedKeywords, forKey: userDefaultsKey)
    }
    
    func getData() -> [String] {
        return userDefaults.object(forKey: userDefaultsKey) as? [String] ?? []
    }
}
