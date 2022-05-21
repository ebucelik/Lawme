//
//  LoginView.swift
//  Lawme
//
//  Created by Ing. Ebu Celik on 15.05.22.
//

import SwiftUI
import ComposableArchitecture

import SwiftHelper

struct LoginView: View {

    let store: Store<LoginCore.State, LoginCore.Action>
    typealias LoginViewStore = ViewStore<LoginCore.State, LoginCore.Action>

    @State var user: User = .emptyMock
    @State var noAccount = false
    @State var showMainView = false
    @State var showErrorAlert = true

    var body: some View {
        WithViewStore(store) { viewStore in
            if !showMainView {
                if !noAccount {
                    loginStateBody(viewStore)
                        .navigationBarHidden(true)
                } else {
                    registerStateBody(viewStore)
                        .navigationBarHidden(true)
                }
            } else {
                MainView(
                    store: .init(
                        initialState: MainCore.State(),
                        reducer: MainCore.reducer,
                        environment: MainCore.Environment(
                            scheduler: .main,
                            service: Services.mainService
                        )
                    ),
                    user: user
                )
            }
        }
        .onAppear {
            if let userData = UserDefaults.standard.object(forKey: LoginCore.LoginKey) as? Data {
                do {
                    user = try JSONDecoder().decode(User.self, from: userData)

                    showMainView = true
                } catch {
                    print("Decoding of \(userData) failed.")
                }
            }
        }
    }

    @ViewBuilder
    func success() -> some View {
        Image(systemName: "checkmark.seal.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(Colors.GreenColor)
    }

    @ViewBuilder
    func loginStateBody(_ viewStore: LoginViewStore) -> some View {
        switch viewStore.userLoadingState {
        case .none:
            loginBody(viewStore)

        case .loading, .refreshing:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))

        case .loaded:
            success()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showMainView = true
                    }
                }

        case .error:
            loginBody(viewStore)
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Fehler"), message: Text("E-Mail oder Passwort fehlerhaft."), dismissButton: .cancel())
                }
        }
    }

    @ViewBuilder
    func loginBody(_ viewStore: LoginViewStore) -> some View {
        ScrollView {
            VStack {
                Image("icon", bundle: .main)
                    .resizable()
                    .frame(width: 300, height: 300)

                VStack {
                    TextField("E-Mail", text: $user.email)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray)
                        )
                        .autocapitalization(.none)

                    SecureField("Password", text: $user.password.toUnwrapped(defaultValue: ""))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray)
                        )
                        .autocapitalization(.none)

                    SpaceDivider(.none)

                    Button(action: {
                        viewStore.send(.login(user))
                    }, label: {
                        Text("Einloggen")
                            .foregroundColor(Color.white)
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Colors.GreenColor)
                    .cornerRadius(10)

                    Button(action: {
                        user = .emptyMock
                        noAccount = true
                    }, label: {
                        Text("Kein Account? Registriere dich jetzt.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    })
                }
                .padding()
            }
            .padding()
        }
    }

    @ViewBuilder
    func registerStateBody(_ viewStore: LoginViewStore) -> some View {
        switch viewStore.registerLoadingState {
        case .none:
            registerBody(viewStore)

        case .loading, .refreshing:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))

        case .loaded:
            success()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showMainView = true
                    }
                }

        case .error:
            registerBody(viewStore)
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Fehler"), message: Text("E-Mail, Benutzername oder Passwort fehlerhaft."), dismissButton: .cancel())
                }
        }
    }

    @ViewBuilder
    func registerBody(_ viewStore: LoginViewStore) -> some View {
        ScrollView {
            VStack {
                Image("icon", bundle: .main)
                    .resizable()
                    .frame(width: 300, height: 300)

                VStack {
                    TextField("E-Mail", text: $user.email)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray)
                        )
                        .autocapitalization(.none)

                    TextField("Benutzername", text: $user.username)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray)
                        )
                        .autocapitalization(.none)

                    SecureField("Password", text: $user.password.toUnwrapped(defaultValue: ""))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray)
                        )
                        .autocapitalization(.none)

                    SpaceDivider(.none)

                    Button(action: {
                        viewStore.send(.register(user))
                    }, label: {
                        Text("Registrieren")
                            .foregroundColor(Color.white)
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Colors.GreenColor)
                    .cornerRadius(10)

                    Button(action: {
                        user = .emptyMock
                        noAccount = false
                    }, label: {
                        Text("Bereits registriert? Hier gehts zum Login.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    })
                }
                .padding()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            store: .init(
                initialState: LoginCore.State(),
                reducer: LoginCore.reducer,
                environment: LoginCore.Environment(
                    service: LoginServiceMock(),
                    scheduler: .main
                )
            )
        )
    }
}
