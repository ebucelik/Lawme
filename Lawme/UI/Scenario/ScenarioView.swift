//
//  ScenarioView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 27.04.22.
//

import SwiftUI

public struct ScenarioView: View {

    let scenario: Scenario

    @State
    var answers: [[Bool]]

    public init(scenario: Scenario, answers: [[Bool]]) {
        self.scenario = scenario
        self.answers = answers

        UINavigationBar.appearance().tintColor = .black
    }

    public var body: some View {
        TabView {
            ForEach(scenario.paragraphs, id: \.self) { paragraph in
                Text(paragraph)
            }

            QuestionBody()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .padding()
    }

    @ViewBuilder
    func QuestionBody() -> some View {
        ScrollView(showsIndicators: false) {
            if let questions = scenario.fragen {
                ForEach(Array(questions.enumerated()), id: \.offset) { index, question in
                    Text(question.frage ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2.bold())

                    SpaceDivider(height: 30, .bottom)

                    Label(title: {
                        Text(question.antwort1 ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.sRGB, red: 241/255, green: 241/255, blue: 241/255, opacity: 1))
                            .cornerRadius(10)
                    }, icon: {
                        if answers[index][0] {
                            Image(systemName: "circle.circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                    })
                    .onTapGesture {
                        answers[index][0] = true
                        answers[index][1] = false
                        answers[index][2] = false
                    }

                    Label(title: {
                        Text(question.antwort2 ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.sRGB, red: 241/255, green: 241/255, blue: 241/255, opacity: 1))
                            .cornerRadius(10)
                    }, icon: {
                        if answers[index][1] {
                            Image(systemName: "circle.circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                    })
                    .onTapGesture {
                        answers[index][0] = false
                        answers[index][1] = true
                        answers[index][2] = false
                    }

                    Label(title: {
                        Text(question.richtigeAntwort ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.sRGB, red: 241/255, green: 241/255, blue: 241/255, opacity: 1))
                            .cornerRadius(10)
                    }, icon: {
                        if answers[index][2] {
                            Image(systemName: "circle.circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                    })
                    .onTapGesture {
                        answers[index][0] = false
                        answers[index][1] = false
                        answers[index][2] = true
                    }

                    SpaceDivider(height: 30, .none)
                }
            }
        }
    }
}

struct ScenarioView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioView(scenario: Scenario.mock[0], answers: [[false, false, false]])
    }
}
