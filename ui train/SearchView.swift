//
//  SearchView.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import SwiftUI
import Domain
import Data
import Networking

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    let getUserDetailsUseCase: GetUserDetailsUseCase

    var body: some View {
        VStack {
            TextField("Search user", text: $searchViewModel.query)
                .textFieldStyle(.roundedBorder)
                .font(.title2.bold())
                .padding()
            Button("Search") {
                Task {
                    await searchViewModel.seachUsers()
                }
            }
            .disabled(searchViewModel.isLoading || searchViewModel.query.isEmpty)
            if searchViewModel.isLoading { ProgressView() }
            List(searchViewModel.usersList) { user in
                NavigationLink {
                    SearchDetailsView(
                        searchDetailsViewModel: SearchDetailsViewModel(getUserDetailsUseCase: getUserDetailsUseCase),
                        login: user.login
                    )
                } label: {
                    HStack {
                        AsyncImage(url: user.avatarUrl) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                        Text(user.login)
                            .font(.headline)
                    }
                }
            }
        }
    }
}

#Preview {
    let networkClient = NetworkClientImpl()
    let service = UsersRemoteServiceImpl(networkClient: networkClient)
    let usersRepo = UsersRepositoryImpl(remoteService: service)
    let userDetailsRepo = UserDetailsRepositoryImpl(remoteService: service)
    let searchUseCase = SearchUsersUseCaseImpl(repository: usersRepo)
    let detailsUseCase = GetUserDetailsUseCaseImpl(repository: userDetailsRepo)
    
    return SearchView(
        searchViewModel: SearchViewModel(searchUsersUseCase: searchUseCase),
        getUserDetailsUseCase: detailsUseCase
    )
}
