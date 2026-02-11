//
//  SearchDetailsViewModel.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation
import Combine
import Domain

@MainActor
class SearchDetailsViewModel: ObservableObject {
    private let getUserDetailsUseCase: GetUserDetailsUseCase
    
    @Published var detail: UserDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init(getUserDetailsUseCase: GetUserDetailsUseCase) {
        self.getUserDetailsUseCase = getUserDetailsUseCase
    }

    func fetchUserDetails(login: String) async {
        isLoading = true
        errorMessage = nil

        do {
            detail = try await getUserDetailsUseCase.execute(login: login)
        } catch {
            detail = nil
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
