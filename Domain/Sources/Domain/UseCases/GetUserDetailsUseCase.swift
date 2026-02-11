//
//  GetUserDetailsUseCase.swift
//  Domain
//

import Foundation

/// Use Case - Obtenir les détails d'un utilisateur
public protocol GetUserDetailsUseCase {
    func execute(login: String) async throws -> UserDetail
}

public final class GetUserDetailsUseCaseImpl: GetUserDetailsUseCase {
    private let repository: UserDetailsRepository
    
    public init(repository: UserDetailsRepository) {
        self.repository = repository
    }
    
    public func execute(login: String) async throws -> UserDetail {
        // Validation métier
        let trimmedLogin = login.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedLogin.isEmpty else {
            throw UseCaseError.invalidInput("Le login ne peut pas être vide")
        }
        
        // Délégation au repository
        return try await repository.getUserDetails(login: trimmedLogin)
    }
}
