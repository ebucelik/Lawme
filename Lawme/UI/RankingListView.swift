//
//  RankingListView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 21.05.22.
//

import SwiftUI

struct RankingListView: View {

    @Binding var presentRankingList: Bool
    let users: [User]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Benutzername")
                            .font(.footnote.bold())
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text("Punkte")
                            .font(.footnote.bold())
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(5)

                    ForEach(users.sorted(by: { $0.points > $1.points } ), id: \.id) { user in
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
                }
                .padding()
                .navigationBarTitle("Rangliste")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentRankingList = false
                        }, label: {
                            Text("Zurück")
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        }
    }
}

struct RankingListView_Previews: PreviewProvider {
    static var previews: some View {
        RankingListView(
            presentRankingList: .constant(true),
            users: User.listMock
        )
    }
}
