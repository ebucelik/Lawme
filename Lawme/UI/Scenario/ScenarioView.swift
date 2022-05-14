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
    @State
    var checkAnswers: Bool = false

    let greenColor = Color(.sRGB, red: 152/255, green: 191/255, blue: 100/255, opacity: 1)
    let grayColor = Color(.sRGB, red: 241/255, green: 241/255, blue: 241/255, opacity: 1)
    let blueColor = Color(.sRGB, red: 125/255, green: 168/255, blue: 208/255, opacity: 1)

    public init(scenario: Scenario, answers: [[Bool]]) {
        self.scenario = scenario
        self.answers = answers

        UINavigationBar.appearance().tintColor = .black
    }

    public var body: some View {
        TabView {
            ForEach(scenario.absaetze, id: \.self) { paragraph in
                VStack(spacing: 50) {
                    Image(systemName: "tortoise.fill")
                        .resizable()
                        .frame(width: 150, height: 100)

                    Text(paragraph)
                }
            }

            if !answers.isEmpty {
                QuestionBody()
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }

    func answersChosen() -> Bool {
        var answerList: [Bool] = []

        answers.forEach({ answer in
            answer.forEach({
                if $0 {
                    answerList.append($0)
                }
            })
        })

        if answerList.count == answers.count {
            return answerList.allSatisfy({ $0 })
        } else {
            return false
        }
    }

    @ViewBuilder
    func QuestionBody() -> some View {
        ScrollView(showsIndicators: false) {
            ForEach(Array(scenario.fragen.enumerated()), id: \.offset) { index, question in
                HStack {
                    Text(question.frage ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2.bold())

                    Text((question.schwierigkeit ?? .none).rawValue)
                        .foregroundColor(.gray)
                }

                SpaceDivider(.bottom)

                AnswersBody(for: index, question)

                SpaceDivider(.none)
            }

            SpaceDivider(height: 15, .none)

            HStack {
                Button(action: {
                    withAnimation(.spring()) {
                        checkAnswers = true
                    }
                }, label: {
                    Text("Antworten überprüfen")
                        .foregroundColor(answersChosen() ? Color.black : grayColor)
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(answersChosen() ? greenColor : Color.gray)
                .disabled(!answersChosen())
                .cornerRadius(10)

                if checkAnswers {
                    Divider()

                    NavigationLink(destination: {
                        LawView()
                    }, label: {
                        Text("Mehr dazu")
                            .foregroundColor(.black)
                            .frame(maxHeight: .infinity)
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(blueColor)
                    .cornerRadius(10)
                }
            }
            .padding(.bottom, 100)
        }
    }

    @ViewBuilder
    func AnswersBody(for index: Int, _ question: Question) -> some View {
        ForEach(Array(question.antworten.enumerated()), id: \.offset) { answerIndex, answer in
            Label(title: {
                Text(answer)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(grayColor)
                    .cornerRadius(10)
            }, icon: {
                if answers[index][answerIndex] {
                    if checkAnswers {
                        if answer == question.richtigeAntwort {
                            Image(systemName: "checkmark.circle.fill").foregroundColor(greenColor)
                        } else {
                            Image(systemName: "x.circle.fill").foregroundColor(.red)
                        }
                    } else {
                        Image(systemName: "circle.circle.fill")
                    }
                } else {
                    Image(systemName: "circle")
                }
            })
            .onTapGesture {
                if !checkAnswers {
                    for (stateAnswerIndex, _) in answers[index].enumerated() {
                        answers[index][stateAnswerIndex] = false
                    }

                    answers[index][answerIndex] = true
                }
            }
        }

        if checkAnswers {
            HStack {
                Text("Erklärung")

                Divider()
                    .frame(width: 16)

                Text(question.erklaerung ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 30)
        }
    }
}

struct ScenarioView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioView(scenario: Scenario.mock[0], answers: [[false, false, false]])
    }
}
