//
//  SearchDetailsViewModel.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation
import Combine

@MainActor
class SearchDetailsViewModel: ObservableObject {
    var userDetailsService: UserDetailsService
    @Published var login: String = ""
    @Published var detail: UserDetails?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init(userDetailsService: UserDetailsService) {
        self.userDetailsService = userDetailsService
    }

    func fetchUserDetails(login: String) async {
        guard !login.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        isLoading = true
        errorMessage = nil

        do {
            detail = try await userDetailsService.fetchUserDetails(login: login)
        } catch {
            detail = nil
            errorMessage = "Failed to fetch user details"
        }
        isLoading = false
    }
}
