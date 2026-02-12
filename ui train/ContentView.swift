//
//  ContentView.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import SwiftUI
import Domain
import Data
import Networking

struct ContentView: View {
    @StateObject private var searchViewModel: SearchViewModel
    private let getUserDetailsUseCase: GetUserDetailsUseCase

    init() {
        // Infrastructure Layer
        let networkClient = NetworkClientImpl()
        
        // Data Layer
        let service = UsersRemoteServiceImpl(networkClient: networkClient)
        let usersRepository = UsersRepositoryImpl(remoteService: service)
        let userDetailsRepository = UserDetailsRepositoryImpl(remoteService: service)
        
        // Domain Layer
        let searchUsersUseCase = SearchUsersUseCaseImpl(repository: usersRepository)
        let getUserDetailsUseCase = GetUserDetailsUseCaseImpl(repository: userDetailsRepository)
        
        // Presentation Layer
        _searchViewModel = StateObject(wrappedValue: SearchViewModel(searchUsersUseCase: searchUsersUseCase))
        self.getUserDetailsUseCase = getUserDetailsUseCase
    }

    var body: some View {
        NavigationStack {
            SearchView(
                searchViewModel: searchViewModel,
                getUserDetailsUseCase: getUserDetailsUseCase
            )
            .navigationTitle("GitHub Users")
        }
    }
}

#Preview {
    ContentView()
}
