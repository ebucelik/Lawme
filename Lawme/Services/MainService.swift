//
//  MainService.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 26.04.22.
//

import Foundation
import Combine

public protocol MainServiceProtocol {
    func getScenario(endpoint: String, method: HTTPMethod, parameters: [String: AnyObject]?) -> AnyPublisher<[Scenario], Error>
}

public class MainService: APIClient, MainServiceProtocol {
    public func getScenario(endpoint: String, method: HTTPMethod, parameters: [String: AnyObject]?) -> AnyPublisher<[Scenario], Error> {
        call(endpoint: endpoint, method: method, data: nil, parameters: parameters)
    }
}

public class MainServiceMock: MainServiceProtocol {
    public func getScenario(endpoint: String, method: HTTPMethod, parameters: [String: AnyObject]?) -> AnyPublisher<[Scenario], Error> {
        Deferred {
            Future { promise in
                promise(.success(Scenario.mock))
            }
        }
        .eraseToAnyPublisher()
    }
}
