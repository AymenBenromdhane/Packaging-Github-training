//
//  SearchUsersUseCase.swift
//  Domain
//

import Foundation

/// Use Case - Rechercher des utilisateurs
public protocol SearchUsersUseCase {
    func execute(query: String) async throws -> [User]
}

public final class SearchUsersUseCaseImpl: SearchUsersUseCase {
    private let repository: UsersRepository
    
    public init(repository: UsersRepository) {
        self.repository = repository
    }
    
    public func execute(query: String) async throws -> [User] {
        // Validation métier
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedQuery.isEmpty else {
            throw UseCaseError.invalidInput("La recherche ne peut pas être vide")
        }
        
        guard trimmedQuery.count >= 2 else {
            throw UseCaseError.invalidInput("La recherche doit contenir au moins 2 caractères")
        }
        
        // Délégation au repository
        return try await repository.searchUsers(query: trimmedQuery)
    }
}
