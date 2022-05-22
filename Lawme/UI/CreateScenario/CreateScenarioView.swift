//
//  CreateScenarioView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 22.05.22.
//

import SwiftUI
import ComposableArchitecture

struct CreateScenarioView: View {
    @Environment(\.presentationMode) var presentationMode

    public typealias CreateScenarioViewStore = ViewStore<CreateScenarioCore.State, CreateScenarioCore.Action>
    let store: Store<CreateScenarioCore.State, CreateScenarioCore.Action>

    @State var paragraphFields = 1
    @State var questionFields = 0

    var body: some View {
        NavigationView {
            WithViewStore(store) { viewStore in
                ScrollView {
                    stateBody(viewStore)
                }
            }
            .navigationTitle("Scenario einreichen")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Zurück")
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }

    @ViewBuilder
    func stateBody(_ viewStore: CreateScenarioViewStore) -> some View {
        switch viewStore.scenarioLoadingState {
        case .none, .loaded:
            VStack {
                setName(viewStore)

                setTheme(viewStore)

                createParagraphs(viewStore)

                createQuestions(viewStore)

                submitButton(viewStore)
            }
            .padding()

        case .loading, .refreshing:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())

        case .error:
            Text("Während des Einreichens deines Scenarios ist ein Fehler aufgetaucht.")
        }
    }

    @ViewBuilder
    func setName(_ viewStore: CreateScenarioViewStore) -> some View {
        SpaceDivider(height: 15, .none)

        Text("Name des Scenarios")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        TextField("Scenarien Name", text: viewStore.binding(\.$scenario.name).toUnwrapped(defaultValue: ""))
            .padding(10)
            .background(Colors.GrayColor)
            .cornerRadius(10)

        SpaceDivider(height: 15, .top)
    }

    @ViewBuilder
    func setTheme(_ viewStore: CreateScenarioViewStore) -> some View {
        SpaceDivider(height: 15, .none)

        Text("Thema des Scenarios")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        TextField("Scenarien Thema", text: viewStore.binding(\.$scenario.thema).toUnwrapped(defaultValue: ""))
            .padding(10)
            .background(Colors.GrayColor)
            .cornerRadius(10)

        SpaceDivider(height: 15, .top)
    }

    @ViewBuilder
    func createParagraphs(_ viewStore: CreateScenarioViewStore) -> some View {
        SpaceDivider(height: 15, .none)

        Text("Absätze")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        ForEach(0..<paragraphFields, id: \.self) { index in
            TextField("Erstelle deinen \((index + 1)). Absatz", text: viewStore.binding(\.$scenario.absaetze[index]))
                .padding(10)
                .background(Colors.GrayColor)
                .cornerRadius(10)
        }

        SpaceDivider(.none)

        Button(action: {
            viewStore.send(.binding(.set(\.$scenario.absaetze, viewStore.state.scenario.absaetze + [""])))

            withAnimation {
                paragraphFields += 1
            }
        }, label: {
            Text("Neuen Absatz hinzufügen")
                .foregroundColor(.black)
                .font(.subheadline.bold())
        })
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(5)
        .background(Colors.BlueColor)
        .cornerRadius(5)

        if paragraphFields > 1 {
            Button(action: {
                withAnimation {
                    paragraphFields -= 1
                }

                let paragraphs = viewStore.state.scenario.absaetze
                viewStore.send(.binding(.set(\.$scenario.absaetze, Array(paragraphs.prefix(paragraphFields)))))
            }, label: {
                Text("Letzten Absatz entfernen")
                    .foregroundColor(.black)
                    .font(.subheadline.bold())
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(5)
            .background(Colors.RedColor)
            .cornerRadius(5)
        }

        SpaceDivider(height: 15, .top)
    }

    @ViewBuilder
    func createQuestions(_ viewStore: CreateScenarioViewStore) -> some View {
        SpaceDivider(height: 15, .none)

        Text("Fragen")
            .font(.subheadline.bold())
            .frame(maxWidth: .infinity, alignment: .leading)

        ForEach(0..<questionFields, id: \.self) { index in
            TextField("Erstelle eine Frage für den \((index + 1)). Absatz",
                      text: viewStore.binding(\.$scenario.fragen[index].frage).toUnwrapped(defaultValue: ""))
                .padding(10)
                .background(Colors.GrayColor)
                .cornerRadius(10)

            createAnswers(viewStore, index: index)
        }

        SpaceDivider(.none)

        Button(action: {
            viewStore.send(.binding(.set(\.$scenario.fragen, viewStore.state.scenario.fragen + [.emptyMock])))

            withAnimation {
                questionFields += 1
            }
        }, label: {
            Text("Neue Frage hinzufügen")
                .foregroundColor(.black)
                .font(.subheadline.bold())
        })
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(5)
        .background(Colors.BlueColor)
        .cornerRadius(5)

        if questionFields > 0 {
            Button(action: {
                withAnimation {
                    questionFields -= 1
                }

                let questions = viewStore.state.scenario.fragen
                viewStore.send(.binding(.set(\.$scenario.fragen,
                                              questionFields == 0 ? [] : Array(questions.prefix(questionFields)))))
            }, label: {
                Text("Letzte Frage entfernen")
                    .foregroundColor(.black)
                    .font(.subheadline.bold())
            })
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(5)
            .background(Colors.RedColor)
            .cornerRadius(5)
        }
    }

    @ViewBuilder
    func createAnswers(_ viewStore: CreateScenarioViewStore, index: Int) -> some View {
        TextField("1. Antwort",
                  text: viewStore.binding(\.$scenario.fragen[index].antworten[0]))
            .padding(10)
            .background(Colors.GrayColor)
            .cornerRadius(10)

        TextField("2. Antwort",
                  text: viewStore.binding(\.$scenario.fragen[index].antworten[1]))
            .padding(10)
            .background(Colors.GrayColor)
            .cornerRadius(10)

        TextField("3. Antwort",
                  text: viewStore.binding(\.$scenario.fragen[index].antworten[2]))
            .padding(10)
            .background(Colors.GrayColor)
            .cornerRadius(10)

        TextField("Gebe die richtige Antwort ein",
                  text: viewStore.binding(\.$scenario.fragen[index].richtigeAntwort).toUnwrapped(defaultValue: ""))
        .padding(10)
        .background(Colors.GrayColor)
        .cornerRadius(10)

        TextField("Erklärung für die Frage",
                  text: viewStore.binding(\.$scenario.fragen[index].erklaerung).toUnwrapped(defaultValue: ""))
        .padding(10)
        .background(Colors.GrayColor)
        .cornerRadius(10)
    }

    @ViewBuilder
    func submitButton(_ viewStore: CreateScenarioViewStore) -> some View {

        SpaceDivider(.all)

        Button(action: {
            viewStore.send(.submitScenario)
        }, label: {
            Text("Scenario abschicken")
                .foregroundColor(checkScenario(viewStore) ? Color.black : Colors.GrayColor)
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(checkScenario(viewStore) ? Colors.GreenColor : Color.gray)
        .disabled(!checkScenario(viewStore))
        .cornerRadius(10)
    }

    func checkScenario(_ viewStore: CreateScenarioViewStore) -> Bool {
        if let name = viewStore.scenario.name,
            !name.isEmpty,
            let thema = viewStore.scenario.thema,
            !thema.isEmpty,
            !viewStore.scenario.absaetze.isEmpty,
            !viewStore.scenario.fragen.isEmpty {
            return viewStore.scenario.fragen.allSatisfy({
                if let frage = $0.frage, !frage.isEmpty,
                   !$0.antworten.isEmpty,
                   let richtigeAntwort = $0.richtigeAntwort, !richtigeAntwort.isEmpty,
                   let erklaerung = $0.erklaerung, !erklaerung.isEmpty {
                    return true
                }

                return false
            })
        }

        return false
    }
}

struct CreateScenarioView_Previews: PreviewProvider {
    static var previews: some View {
        CreateScenarioView(
            store: .init(
                initialState: CreateScenarioCore.State(),
                reducer: CreateScenarioCore.reducer,
                environment: CreateScenarioCore.Environment(scheduler: .main)
            )
        )
    }
}
