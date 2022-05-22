//
//  Question.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation

public struct Question: Identifiable, Codable, Equatable {
    public let id: Int?
    var frage: String?
    var schwierigkeit: Difficulty?
    var antworten: [String]
    var richtigeAntwort: String?
    var erklaerung: String?

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

    static var emptyMock: Question {
        Question(
            id: nil,
            frage: nil,
            schwierigkeit: nil,
            antworten: ["", "", ""],
            richtigeAntwort: nil,
            erklaerung: nil
        )
    }
}
