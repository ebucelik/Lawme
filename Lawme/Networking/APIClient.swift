//
//  APIClient.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import Foundation
import Combine

class APIError: Error {}

public class APIClient {
    let domain = "http://localhost:8090/api/v1/"

    public init() { }

    public func call<T>(endpoint: String, method: HTTPMethod, data: T?, parameters: [String: AnyObject]?) -> AnyPublisher<T, Error> where T: Codable {
        Deferred {
            Future { promise in
                var url = self.domain + endpoint

                if let parameters = parameters {
                    url.append(parameters.map({ key, value in
                        return "\(key)=\(value)"
                    }).joined(separator: "&"))
                }

                guard let url = URL(string: url) else { return promise(.failure(APIError()))}

                do {
                    try self.call(url: url, method: method, data: data) { (result: Result<T, Error>) in
                        switch result {
                        case .success(let success):
                            promise(.success(success))
                        case .failure(let failure):
                            promise(.failure(failure))
                        }
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    private func call<T>(url: URL, method: HTTPMethod, data: T?, block: @escaping (Result<T, Error>) -> ()) throws where T: Codable {

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        if let data = data {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(data)
            } catch {
                throw error
            }
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let response = response {
                print("Response >>> \(response)")
            }

            if let error = error {
                block(.failure(error))
            } else if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)

                    block(.success(model))
                } catch {
                    block(.failure(error))
                }
            }
        }
        .resume()
    }
}
