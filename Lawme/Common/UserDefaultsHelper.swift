//
//  UserDefaultsHelper.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 22.05.22.
//

import UIKit

class UserDefaultsHelper {
    public static func deleteAll() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
