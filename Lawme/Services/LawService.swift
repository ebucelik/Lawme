//
//  LawService.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation
import Combine

public protocol LawServiceProtocol {
    func getLaw(endpoint: String, method: HTTPMethod, parameters: [String: AnyObject]?) -> AnyPublisher<[Law], Error>
}

public class LawService: APIClient, LawServiceProtocol {
    public func getLaw(endpoint: String, method: HTTPMethod, parameters: [String : AnyObject]?) -> AnyPublisher<[Law], Error> {
        call(endpoint: endpoint, method: method, data: nil, parameters: parameters)
    }
}

public class LawServiceMock: LawServiceProtocol {
    public func getLaw(endpoint: String, method: HTTPMethod, parameters: [String : AnyObject]?) -> AnyPublisher<[Law], Error> {
        Deferred {
            Future { promise in
                promise(.success([.mock]))
            }
        }
        .eraseToAnyPublisher()
    }
}
