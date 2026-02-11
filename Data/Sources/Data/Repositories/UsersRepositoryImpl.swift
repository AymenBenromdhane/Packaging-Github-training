//
//  UsersRepositoryImpl.swift
//  Data
//

import Foundation
import Domain

/// Implémentation du repository Users
public final class UsersRepositoryImpl: UsersRepository {
    private let remoteDataSource: UsersRemoteDataSource
    
    public init(remoteDataSource: UsersRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func searchUsers(query: String) async throws -> [User] {
        let response = try await remoteDataSource.searchUsers(query: query)
        return try response.items.map { try UserMapper.toDomain($0) }
    }
}

/// Implémentation du repository UserDetails
public final class UserDetailsRepositoryImpl: UserDetailsRepository {
    private let remoteDataSource: UsersRemoteDataSource
    
    public init(remoteDataSource: UsersRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getUserDetails(login: String) async throws -> UserDetail {
        let dto = try await remoteDataSource.getUserDetails(login: login)
        return try UserMapper.toDomain(dto)
    }
}
