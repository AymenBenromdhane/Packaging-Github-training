//
//  UsersRepository.swift
//  Domain
//

import Foundation

/// Protocol du repository pour la recherche d'utilisateurs
public protocol UsersRepository {
    func searchUsers(query: String) async throws -> [User]
}

/// Protocol du repository pour les détails d'un utilisateur
public protocol UserDetailsRepository {
    func getUserDetails(login: String) async throws -> UserDetail
}
