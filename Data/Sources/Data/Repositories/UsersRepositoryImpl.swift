//
//  UsersRepositoryImpl.swift
//  Data
//

import Foundation
import Domain

/// Implémentation du repository Users
public final class UsersRepositoryImpl: UsersRepository {
    private let remoteService: UsersRemoteService
    
    public init(remoteService: UsersRemoteService) {
        self.remoteService = remoteService
    }
    
    public func searchUsers(query: String) async throws -> [User] {
        let response = try await remoteService.searchUsers(query: query)
        return try response.items.map { try UserMapper.toDomain($0) }
    }
}

/// Implémentation du repository UserDetails
public final class UserDetailsRepositoryImpl: UserDetailsRepository {
    private let remoteService: UsersRemoteService
    
    public init(remoteService: UsersRemoteService) {
        self.remoteService = remoteService
    }
    
    public func getUserDetails(login: String) async throws -> UserDetail {
        let dto = try await remoteService.getUserDetails(login: login)
        return try UserMapper.toDomain(dto)
    }
}
