//
//  User.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 15.05.22.
//

import Foundation

public struct User: Identifiable, Codable, Equatable {
    public let id: Int
    var email: String
    var username: String
    var password: String?
    let points: Int

    public init(id: Int, email: String, username: String, password: String?, points: Int) {
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.points = points
    }
}

extension User {
    static var mock: User {
        User(
            id: 99,
            email: "ebucelik1@hotmail.com",
            username: "ebucelik10",
            password: nil,
            points: 7
        )
    }

    static var emptyMock: User {
        User(
            id: -1,
            email: "",
            username: "",
            password: nil,
            points: -1
        )
    }
}
