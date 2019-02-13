//
//  UserDefaultExtension.swift
//  chargeup
//
//  Created by Megat Syafiq on 14/08/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import UIKit
extension UserDefaults {
    
    func setValue(value: String, key: String) {
        set(value, forKey: key)
        synchronize()
    }
    
    func getValue(key: String) -> String {
        return string(forKey: key)!
    }
}
