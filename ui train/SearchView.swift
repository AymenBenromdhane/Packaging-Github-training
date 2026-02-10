//
//  SearchView.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    let userDetailsService: UserDetailsService

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
                    SearchDetailsView(searchDetailsViewModel: SearchDetailsViewModel(userDetailsService: userDetailsService), login: user.login)
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
    SearchView(searchViewModel: SearchViewModel(usersService: UsersServiceMock()), userDetailsService: UserDetailServiceMock())
}
