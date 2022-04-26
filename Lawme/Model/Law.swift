//
//  Law.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation

public struct Law: Identifiable, Codable {
    public let id: Int?
    let artikel: String?
    let paragraph: String?
    let gesetzBuch: String?
    let inhalt: String?

    public init(id: Int?, artikel: String?, paragraph: String?, gesetzBuch: String?, inhalt: String?) {
        self.id = id
        self.artikel = artikel
        self.paragraph = paragraph
        self.gesetzBuch = gesetzBuch
        self.inhalt = inhalt
    }
}

public extension Law {
    static var mock: Law {
        Law(id: 1,
            artikel: "Einvernehmlich Kündigen",
            paragraph: "§ 15 Abs. 3",
            gesetzBuch: "Strafgesetzbuch",
            inhalt: "Laut Strafgesetzbuch dürfen Sie folgende Tätigkeit nicht durchführen, wenn folgendes gegeben ist ...")
    }
}
