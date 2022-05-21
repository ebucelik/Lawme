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

    static var listMock: [User] {
        [
            User(
                id: 1,
                email: "ebucelik1@hotmail.at",
                username: "ebucelik10",
                password: nil,
                points: 10
            ),
            User(
                id: 2,
                email: "tomcruise@hotmail.com",
                username: "tommy",
                password: nil,
                points: 12
            ),
            User(
                id: 3,
                email: "johnnydepp@gmail.com",
                username: "depp11",
                password: nil,
                points: 7
            ),
            User(
                id: 4,
                email: "elonmusk@gmx.com",
                username: "elonmusky",
                password: nil,
                points: 13
            ),
            User(
                id: 5,
                email: "stevejobs@icloud.com",
                username: "applexjobs",
                password: nil,
                points: 5
            )
        ]
    }
}
