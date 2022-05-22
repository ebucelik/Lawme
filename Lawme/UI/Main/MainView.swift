//
//  MainView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 24.04.22.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {

    typealias MainViewStore = ViewStore<MainCore.State, MainCore.Action>
    let store: Store<MainCore.State, MainCore.Action>
    let user: User

    @State var difficulty: Difficulty = .LEICHT
    @State var presentRankingList = false
    @State var presentCreateScenario = false

    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView(showsIndicators: false) {
                    VStack {
                        Image("icon", bundle: .main)
                            .resizable()
                            .frame(width: 150, height: 150)

                        Text("Willkommen bei \nLawMe")
                            .font(.title.bold())
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

                        accountBody()

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
    func accountBody() -> some View {
        Text("Dein Profil")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        VStack {
            HStack {
                Text("E-Mail")
                    .foregroundColor(.gray)
                    .font(.footnote.bold())
                    .frame(maxWidth: 125, alignment: .center)

                Divider()

                Text(user.email)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            HStack {
                Text("Benutzername")
                    .foregroundColor(.gray)
                    .font(.footnote.bold())
                    .frame(maxWidth: 125, alignment: .center)

                Divider()

                Text(user.username)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            HStack {
                Text("Punkte")
                    .foregroundColor(.gray)
                    .font(.footnote.bold())
                    .frame(maxWidth: 125, alignment: .center)

                Divider()

                Text("\(user.points)")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            SpaceDivider(.none)

            Button(action: {
                print("sdsd")
            }, label: {
                Text("Bearbeiten")
                    .foregroundColor(.black)
                    .font(.subheadline.bold())
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(5)
            .background(Colors.BlueColor)
            .cornerRadius(5)
        }

        SpaceDivider()
    }

    @ViewBuilder
    func stateBody(_ viewStore: MainViewStore) -> some View {
        switch viewStore.scenariosLoadingState {
        case .none, .refreshing, .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))

        case let .error(error):
            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.icloud.fill")
                    .resizable()
                    .frame(width: 100, height: 75)
                    .foregroundColor(.black)

                Text("While fetching data an error has happened: \n\n\(error.localizedDescription)")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .center)
            }

        case let .loaded(scenarios):
            scenarioBody(scenarios)

            SpaceDivider()

            rankingListBody()

            SpaceDivider()

            moreBody()

            SpaceDivider(height: 15, .none)

            Text("Copyright © LawMe 2022")
                .font(.system(size: 10))
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    @ViewBuilder
    func scenarioBody(_ scenarios: [Scenario]) -> some View {
        Text("Szenarien")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        ForEach(scenarios, id: \.id) { scenario in
            NavigationLink(
                destination: ScenarioView(
                    scenario: scenario,
                    answers: getStateAnswers(questions: scenario.fragen)
                )
            ) {
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

        SpaceDivider(height: 15, .none)

        Button(action: {
            presentCreateScenario = true
        }, label: {
            Text("Eigenes Scenario einreichen")
                .foregroundColor(.black)
                .font(.subheadline.bold())
        })
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(5)
        .background(Colors.BlueColor)
        .cornerRadius(5)
        .fullScreenCover(isPresented: $presentCreateScenario) {
            CreateScenarioView(
                store: .init(
                    initialState: CreateScenarioCore.State(),
                    reducer: CreateScenarioCore.reducer,
                    environment: CreateScenarioCore.Environment(scheduler: .main))
            )
        }
    }

    @ViewBuilder
    func rankingListBody() -> some View {
        Text("Rangliste")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        HStack {
            Text("Benutzername")
                .font(.footnote.bold())
                .frame(maxWidth: .infinity, alignment: .center)

            Text("Punkte")
                .font(.footnote.bold())
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(5)

        ForEach(User.listMock.sorted(by: { $0.points > $1.points } ).prefix(3), id: \.id) { user in
            HStack {
                Text(user.username)
                    .foregroundColor(.gray)
                    .font(.footnote.bold())
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("\(user.points)")
                    .foregroundColor(.gray)
                    .font(.footnote.bold())
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(5)
            .background(Colors.GrayColor)
            .cornerRadius(5)
        }

        SpaceDivider(.none)

        Button(action: {
            presentRankingList = true
        }, label: {
            Text("Ganze Rangliste öffnen")
                .foregroundColor(.black)
                .font(.subheadline.bold())
        })
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(5)
        .background(Colors.BlueColor)
        .cornerRadius(5)
        .sheet(isPresented: $presentRankingList) {
            RankingListView(
                presentRankingList: $presentRankingList,
                users: User.listMock
            )
        }
    }

    @ViewBuilder
    func moreBody() -> some View {
        Text("Mehr")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        ForEach(More.allCases, id: \.self) { more in
            NavigationLink(
                destination: MoreView(more: more)
            ) {
                HStack {
                    Text(more.rawValue)

                    Spacer()

                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color(.sRGB, red: 241/255, green: 241/255, blue: 241/255, opacity: 1))
                .cornerRadius(10)
            }
            .foregroundColor(.black)
        }
    }

    func getStateAnswers(questions: [Question]) -> [[Bool]] {
        var answers: [Bool] = []
        var stateAnswers: [[Bool]] = []

        questions.forEach { question in
            question.antworten.forEach { _ in
                answers.append(false)
            }

            stateAnswers.append(answers)

            answers = []
        }

        return stateAnswers
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            store: .init(
                initialState: MainCore.State(scenariosLoadingState: .loaded(Scenario.mock)),
                reducer: MainCore.reducer,
                environment: MainCore.Environment(
                    scheduler: .main,
                    service: Services.mainService
                )
            ),
            user: .mock
        )
    }
}
