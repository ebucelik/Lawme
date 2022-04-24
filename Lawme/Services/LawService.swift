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

public class LawService: LawServiceProtocol {
    public func getLaw(endpoint: String, method: HTTPMethod, parameters: [String : AnyObject]?) -> AnyPublisher<[Law], Error> {
        NetworkManager.shared.call(endpoint: endpoint, method: method, data: nil, parameters: parameters)
    }
}
