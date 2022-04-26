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
    let antwort1: String?
    let antwort2: String?
    let richtigeAntwort: String?
    let erklaerung: String?

    public init(id: Int?, frage: String?, antwort1: String?, antwort2: String?, richtigeAntwort: String?, erklaerung: String?) {
        self.id = id
        self.frage = frage
        self.antwort1 = antwort1
        self.antwort2 = antwort2
        self.richtigeAntwort = richtigeAntwort
        self.erklaerung = erklaerung
    }
}

public extension Question {
    static var mock: Question {
        Question(id: 1,
                 frage: "Was war hier falsch?",
                 antwort1: "Nach Monitoren fragen",
                 antwort2: "Drohen",
                 richtigeAntwort: "Drohen",
                 erklaerung: "Weil schnelle und direkte Kommunikation besser für den Verlauf der Arbeitsprozesse ist.")
    }
}
