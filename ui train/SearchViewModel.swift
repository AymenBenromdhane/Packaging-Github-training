//
//  SearchViewModel.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation
import Combine
import Domain

@MainActor
final class SearchViewModel: ObservableObject {
    private let searchUsersUseCase: SearchUsersUseCase
    
    @Published var query: String = ""
    @Published var usersList: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    init(searchUsersUseCase: SearchUsersUseCase) {
        self.searchUsersUseCase = searchUsersUseCase
    }

    func seachUsers() async {
        isLoading = true
        errorMessage = nil
        
        do {
            usersList = try await searchUsersUseCase.execute(query: query)
        } catch {
            usersList = []
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
