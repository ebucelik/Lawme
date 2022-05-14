//
//  Scenario.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation

public struct Scenario: Identifiable, Codable, Equatable {
    public let id: Int?
    let name: String?
    let fragen: [Question]
    let thema: String?
    let absaetze: [String]

    public init(id: Int?, name: String?, fragen: [Question], thema: String?, absaetze: [String]) {
        self.id = id
        self.name = name
        self.fragen = fragen
        self.thema = thema
        self.absaetze = absaetze
    }
}

public extension Scenario {
    static var mock: [Scenario] {
        [
            Scenario(
                id: 1,
                name: "Kündigen",
                fragen: [.mock],
                thema: "",
                absaetze: [
                    "Du hast die Nase voll von deiner Arbeit.",
                    "Nach stundenlanger Überlegung platzt du in das Büro deiner Vorgesetzten:in.",
                    "Du drohst mit einer Kündigung, wenn du keine neuen Monitore bekommst."
                ]
            ),
            Scenario(
                id: 2,
                name: "Krankenstand",
                fragen: [.mock],
                thema: "",
                absaetze: [
                    "Du hast die Nase voll von deiner Arbeit.",
                    "Nach stundenlanger Überlegung platzt du in das Büro deiner Vorgesetzten:in.",
                    "Du drohst mit einer Kündigung, wenn du keine neuen Monitore bekommst."
                ]
            )
        ]
    }
}
