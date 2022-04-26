//
//  LawmeApp.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import SwiftUI

@main
struct LawmeApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(store: .init(
                initialState: MainCore.State(),
                reducer: MainCore.reducer,
                environment: MainCore.Environment(
                    scheduler: .main,
                    service: Services.mainService))
            )
        }
    }
}
