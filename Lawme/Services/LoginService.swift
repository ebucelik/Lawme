//
//  LoginService.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 15.05.22.
//

import Foundation
import Combine

public protocol LoginServiceProtocol {
    func login(endpoint: String, method: HTTPMethod, data: User) -> AnyPublisher<User, Error>
    func register(endpoint: String, method: HTTPMethod, data: User) -> AnyPublisher<User, Error>
    func forgotPassword(endpoint: String, method: HTTPMethod, parameters: [String: AnyObject]?) -> AnyPublisher<Bool, Error>
}

public class LoginService: APIClient, LoginServiceProtocol {
    public func login(endpoint: String, method: HTTPMethod, data: User) -> AnyPublisher<User, Error> {
        call(endpoint: endpoint, method: method, data: data, parameters: nil)
    }

    public func register(endpoint: String, method: HTTPMethod, data: User) -> AnyPublisher<User, Error> {
        call(endpoint: endpoint, method: method, data: data, parameters: nil)
    }

    public func forgotPassword(endpoint: String, method: HTTPMethod, parameters: [String: AnyObject]?) -> AnyPublisher<Bool, Error> {
        call(endpoint: endpoint, method: method, data: nil, parameters: parameters)
    }
}

#if DEBUG
public class LoginServiceMock: LoginServiceProtocol {
    public func login(endpoint: String, method: HTTPMethod, data: User) -> AnyPublisher<User, Error> {
        Deferred {
            Future { promise in
                promise(.success(.mock))
            }
        }.eraseToAnyPublisher()
    }

    public func register(endpoint: String, method: HTTPMethod, data: User) -> AnyPublisher<User, Error> {
        Deferred {
            Future { promise in
                promise(.success(.mock))
            }
        }.eraseToAnyPublisher()
    }

    public func forgotPassword(endpoint: String, method: HTTPMethod, parameters: [String : AnyObject]?) -> AnyPublisher<Bool, Error> {
        Deferred {
            Future { promise in
                promise(.success(true))
            }
        }.eraseToAnyPublisher()
    }
}
#endif
