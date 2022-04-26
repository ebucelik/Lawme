//
//  MainCore.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 26.04.22.
//

import Foundation
import ComposableArchitecture
import Combine

import SwiftHelper

public class MainCore {

    public typealias ScenariosLoadingState = Loadable<[Scenario]>

    public struct State: Equatable {
        var scenarios: [Scenario]
        var scenariosLoadingState: ScenariosLoadingState

        public init(scenarios: [Scenario] = [], scenariosLoadingState: ScenariosLoadingState = .none) {
            self.scenarios = scenarios
            self.scenariosLoadingState = scenariosLoadingState
        }
    }

    public enum Action {
        case getScenarios
        case scenariosStateChanged(ScenariosLoadingState)
    }

    public struct Environment {
        var scheduler: AnySchedulerOf<DispatchQueue>
        var service: MainServiceProtocol
    }

    static let reducer = Reducer<State, Action, Environment> { state, action, environment in
        switch action {
        case .getScenarios:
            return environment.service
                .getScenario(endpoint: "szenario/", method: .get, parameters: nil)
                .receive(on: environment.scheduler)
                .map({ .scenariosStateChanged(.loaded($0)) })
                .prepend(.scenariosStateChanged(.loading))
                .catch { Just(.scenariosStateChanged(.error($0))) }
                .delay(for: 2, scheduler: environment.scheduler)
                .eraseToEffect()

        case let .scenariosStateChanged(scenariosLoadingState):
            state.scenariosLoadingState = scenariosLoadingState

            if case let .loaded(scenarios) = scenariosLoadingState {
                state.scenarios = scenarios
            }

            return .none
        }
    }
}
