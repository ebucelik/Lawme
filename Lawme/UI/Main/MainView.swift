//
//  MainView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {

    var store: Store<MainCore.State, MainCore.Action>
    typealias MainViewStore = ViewStore<MainCore.State, MainCore.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("Willkommen bei \nLawme")
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Deinem Arbeitsrecht Experten To-Go")
                            .font(.subheadline.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)

                        SpaceDivider(.bottom)

                        HStack(spacing: 15) {
                            Image(systemName: "info.circle")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 30, height: 30, alignment: .center)

                            Text("Wir von Lawme wollen durch einfache Beispiel Szenarien dir dein Recht aus der Arbeit einfach erklären. Kein Lesen von langen, undeutlichen und langweiligen Texten mehr.")
                                .font(.footnote)
                        }

                        SpaceDivider()

                        stateBody(viewStore)
                    }
                }
                .padding()
                .onAppear {
                    if viewStore.scenariosLoadingState == .none {
                        viewStore.send(.getScenarios)
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }

    @ViewBuilder
    func stateBody(_ viewStore: MainViewStore) -> some View {
        switch viewStore.scenariosLoadingState {
        case .none, .refreshing, .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))

        case let .error(error):
            Text("While fetching data an error has happened: \(error.localizedDescription)")
                .font(.title3.bold())
                .frame(maxWidth: .infinity, alignment: .center)

        case let .loaded(scenarios):
            Text("Szenarien")
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(scenarios, id: \.id) { scenario in
                NavigationLink(destination: ScenarioView(scenario: scenario,
                                                         answers: getStateAnswers(questionCount: scenario.fragen?.count ?? 0))) {
                    HStack {
                        Text(scenario.name ?? "Test")

                        Spacer()

                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color(.sRGB, red: 241/255, green: 241/255, blue: 241/255, opacity: 1))
                    .cornerRadius(10)
                }
                .foregroundColor(.black)

                SpaceDivider(height: 15, .none)
            }
        }
    }

    func getStateAnswers(questionCount: Int) -> [[Bool]] {
        var stateAnswers: [[Bool]] = []

        (0..<questionCount).forEach { _ in
            stateAnswers.append([false, false, false])
        }

        return stateAnswers
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: .init(
            initialState: MainCore.State(scenariosLoadingState: .loaded(Scenario.mock)),
            reducer: MainCore.reducer,
            environment: MainCore.Environment(
                scheduler: .main,
                service: Services.mainService))
        )
    }
}
