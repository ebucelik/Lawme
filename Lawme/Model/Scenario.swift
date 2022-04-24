//
//  Scenario.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation

public struct Scenario: Identifiable, Codable {
    public let id: Int?
    let name: String?
    let fragen: [Question]?
    let schwierigkeit: Difficulty?
    let absatz1: String?
    let absatz2: String?
    let absatz3: String?
    let absatz4: String?
    let absatz5: String?
    let absatz6: String?
    let absatz7: String?
    let absatz8: String?
    let absatz9: String?
    let absatz10: String?

    public init(id: Int?, name: String?, fragen: [Question]?, schwierigkeit: Difficulty?, absatz1: String?, absatz2: String?, absatz3: String?, absatz4: String?, absatz5: String?, absatz6: String?, absatz7: String?, absatz8: String?, absatz9: String?, absatz10: String?) {
        self.id = id
        self.name = name
        self.fragen = fragen
        self.schwierigkeit = schwierigkeit
        self.absatz1 = absatz1
        self.absatz2 = absatz2
        self.absatz3 = absatz3
        self.absatz4 = absatz4
        self.absatz5 = absatz5
        self.absatz6 = absatz6
        self.absatz7 = absatz7
        self.absatz8 = absatz8
        self.absatz9 = absatz9
        self.absatz10 = absatz10
    }
}