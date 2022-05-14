//
//  Question.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation

public struct Question: Identifiable, Codable, Equatable {
    public let id: Int?
    let frage: String?
    let schwierigkeit: Difficulty?
    let antworten: [String]
    let richtigeAntwort: String?
    let erklaerung: String?

    public init(id: Int?, frage: String?, schwierigkeit: Difficulty?, antworten: [String], richtigeAntwort: String?, erklaerung: String?) {
        self.id = id
        self.frage = frage
        self.schwierigkeit = schwierigkeit
        self.antworten = antworten
        self.richtigeAntwort = richtigeAntwort
        self.erklaerung = erklaerung
    }
}

public extension Question {
    static var mock: Question {
        Question(
            id: 1,
            frage: "Was war hier falsch?",
            schwierigkeit: .MITTEL,
            antworten: [
                "Nach Monitoren fragen",
                "Drohen"
            ],
            richtigeAntwort: "Drohen",
            erklaerung: "Weil schnelle und direkte Kommunikation besser für den Verlauf der Arbeitsprozesse ist."
        )
    }
}
