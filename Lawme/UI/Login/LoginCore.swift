//
//  LoginCore.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 15.05.22.
//

import Foundation
import Combine
import ComposableArchitecture

import SwiftHelper

public class LoginCore {

    public static let LoginKey = "Login"
    public typealias UserLoadingState = Loadable<User>

    public struct State: Equatable {
        var user: User?
        var userLoadingState: UserLoadingState = .none

        var registerLoadingState: UserLoadingState = .none
    }

    public enum Action {
        case login(User)
        case loginStateChanged(UserLoadingState)

        case register(User)
        case registerStateChanged(UserLoadingState)

        case forgotPassword(String, String)
    }

    public struct Environment {
        let service: LoginServiceProtocol
        let scheduler: AnySchedulerOf<DispatchQueue>
    }

    public static let reducer = Reducer<State, Action, Environment> { state, action, environment in
        switch action {
        case let .login(user):
            return environment.service
                .login(endpoint: "auth/signin/", method: .post, data: user)
                .receive(on: environment.scheduler)
                .delay(for: 2, scheduler: environment.scheduler)
                .map({ .loginStateChanged(.loaded($0)) })
                .prepend(.loginStateChanged(.loading))
                .catch { Just(.loginStateChanged(.error($0))) }
                .eraseToEffect()

        case let .loginStateChanged(userLoadingState):
            state.userLoadingState = userLoadingState

            if case let .loaded(user) = userLoadingState {
                do {
                    let data = try JSONEncoder().encode(user)

                    UserDefaults.standard.set(data, forKey: LoginCore.LoginKey)
                } catch {
                    print("Encoding of \(user) failed.")
                }

                state.user = user
            }

            return .none

        case let .register(user):
            return environment.service
                .register(endpoint: "auth/register/", method: .post, data: user)
                .receive(on: environment.scheduler)
                .delay(for: 2, scheduler: environment.scheduler)
                .map({ .registerStateChanged(.loaded($0)) })
                .prepend(.registerStateChanged(.loading))
                .catch { Just(.registerStateChanged(.error($0))) }
                .eraseToEffect()

        case let .registerStateChanged(registerLoadingState):
            state.registerLoadingState = registerLoadingState

            if case let .loaded(user) = registerLoadingState {
                state.user = user
            }

            return .none
            
        case let .forgotPassword(email, password):
            return .none
        }
    }
}
