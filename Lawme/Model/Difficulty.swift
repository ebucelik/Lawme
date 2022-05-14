//
//  Difficulty.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation

public enum Difficulty: String, Codable, Equatable, CaseIterable {
    case LEICHT
    case MITTEL
    case SCHWER
    case none = ""
}
