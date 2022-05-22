//
//  CreateScenarioService.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 22.05.22.
//

import Foundation

public protocol CreateScenarioServiceProtocol {
    func submitScenario(scenario: Scenario) async throws -> Scenario
}

public class CreateScenarioService: APIClient, CreateScenarioServiceProtocol {
    public func submitScenario(scenario: Scenario) async throws -> Scenario {
        do {
            return try await asyncCall(endpoint: "createScenario/", method: .post, data: scenario, parameters: nil)
        } catch {
            print("Failed to submit scenario due to: \(error)")
            throw APIError()
        }
    }
}
