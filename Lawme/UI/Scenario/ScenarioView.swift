//
//  ScenarioView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 27.04.22.
//

import SwiftUI

public struct ScenarioView: View {

    let scenario: Scenario

    public init(scenario: Scenario) {
        self.scenario = scenario

        UINavigationBar.appearance().tintColor = .black
    }

    public var body: some View {
        Text(scenario.name ?? "Test")
    }
}

struct ScenarioView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioView(scenario: Scenario.mock[0])
    }
}
