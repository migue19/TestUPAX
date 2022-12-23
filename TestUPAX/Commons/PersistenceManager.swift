//
//  PersistenceManager.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//

import Foundation

class PersistenceManager {
    static func saveInfoUserDefaults(value: String, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func getInfoUserDefaults(key: String) -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: key)
    }
    
    static func deleteInfoUserDefaults(key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
    
    static func saveEntity<T: Codable>(data: T, key: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(data)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    static func getEntity<T: Codable>(type: T.Type, key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(T.self, from: data)
                return data
            } catch {
                print("Unable to Decode Note (\(error))")
                return nil
            }
        }
        return nil
    }
}

struct PersistenceManagerKey {
    static let userData = "userData"
}
