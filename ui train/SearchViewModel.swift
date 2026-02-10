//
//  SearchViewModel.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    private var usersService: UsersService
    @Published var query: String = ""
    @Published var usersList: [UserSummary] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    init(usersService: UsersService) {
        self.usersService = usersService
    }

    func seachUsers() async {
        guard !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }

        isLoading = true
        errorMessage = nil
        do {
            usersList = try await usersService.fetchUsers(query: query)
        } catch {
            usersList = []
            errorMessage = "Failed to fetch users"
        }
        isLoading = false
    }
}
