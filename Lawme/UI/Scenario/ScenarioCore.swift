//
//  ScenarioCore.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 28.04.22.
//

import Foundation
import ComposableArchitecture

public class ScenarioCore {

    public struct State: Equatable {

    }

    public enum Action {
        case checkAnswers
        case submitAnswers
    }

    public struct Environment {
        var scheduler: AnySchedulerOf<DispatchQueue>
    }
}
