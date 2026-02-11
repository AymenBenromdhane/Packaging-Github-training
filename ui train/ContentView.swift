//
//  ContentView.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import SwiftUI
import Networking
import Entities

struct ContentView: View {
    @StateObject private var searchViewModel: SearchViewModel
    private let userDetailService: UserDetailsService

    init() {
        let usersService = UsersServiceImpl()
        _searchViewModel = StateObject(wrappedValue: SearchViewModel(usersService: usersService))
        userDetailService = UserDetailsServiceImpl()
    }

    var body: some View {
        NavigationStack {
            SearchView(
                searchViewModel: searchViewModel,
                userDetailsService: userDetailService
            )
            .navigationTitle("GitHub Users")
        }
    }
}

#Preview {
    ContentView()
}
