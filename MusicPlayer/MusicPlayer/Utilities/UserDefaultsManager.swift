//
//  UserDefaultsManager.swift
//  MusicPlayer
//
//  Created by 4n4rk0z on 22/01/21.
//

import Foundation

class UserDefaultsManager {
    static func set(value: Any, for key: UserDefaultsKey) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(object forKey: UserDefaultsKey) -> Any? {
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
    
    static func delete(object forKey: UserDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: forKey.rawValue)
    }
}
