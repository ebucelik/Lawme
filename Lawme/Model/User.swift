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
    let userRole: UserRole
    let points: Int

    public enum UserRole: String, Codable, Equatable {
        case USER
        case ADMIN
    }

    public init(id: Int, email: String, username: String, password: String?, userRole: UserRole, points: Int) {
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.userRole = userRole
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
            userRole: .ADMIN,
            points: 7
        )
    }

    static var emptyMock: User {
        User(
            id: -1,
            email: "",
            username: "",
            password: nil,
            userRole: .USER,
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
                userRole: .ADMIN,
                points: 10
            ),
            User(
                id: 2,
                email: "tomcruise@hotmail.com",
                username: "tommy",
                password: nil,
                userRole: .USER,
                points: 12
            ),
            User(
                id: 3,
                email: "johnnydepp@gmail.com",
                username: "depp11",
                password: nil,
                userRole: .USER,
                points: 7
            ),
            User(
                id: 4,
                email: "elonmusk@gmx.com",
                username: "elonmusky",
                password: nil,
                userRole: .USER,
                points: 13
            ),
            User(
                id: 5,
                email: "stevejobs@icloud.com",
                username: "applexjobs",
                password: nil,
                userRole: .USER,
                points: 5
            )
        ]
    }
}
