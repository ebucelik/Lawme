//
//  CreateScenarioCore.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 22.05.22.
//

import Foundation
import ComposableArchitecture

import SwiftHelper

public class CreateScenarioCore {

    public struct State: Equatable {
        @BindableState var scenario: Scenario
        var scenarioLoadingState: Loadable<Scenario>

        public init(scenario: Scenario = .emptyMock, scenarioLoadingState: Loadable<Scenario> = .none) {
            self.scenario = scenario
            self.scenarioLoadingState = scenarioLoadingState
        }
    }

    public enum Action: BindableAction {
        case submitScenario
        case submitScenarioStateChanged(Loadable<Scenario>)
        case binding(BindingAction<State>)
    }

    public struct Environment {
        let scheduler: AnySchedulerOf<DispatchQueue>
    }

    public static let reducer = Reducer<State, Action, Environment> { state, action, environment in
        switch action {
        case .submitScenario:
            return .none

        case let .submitScenarioStateChanged(scenarioLoadingState):
            return .none

        case .binding:
            return .none
        }
    }
        .binding()
}
