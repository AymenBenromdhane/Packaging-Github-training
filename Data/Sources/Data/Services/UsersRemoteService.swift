//
//  UsersRemoteService.swift
//  Data
//

import Foundation
import Networking

/// Service - Récupération des utilisateurs depuis l'API
public protocol UsersRemoteService {
    func searchUsers(query: String) async throws -> SearchResponseDTO
    func getUserDetails(login: String) async throws -> UserDetailsDTO
}

public final class UsersRemoteServiceImpl: UsersRemoteService {
    private let networkClient: NetworkClient
    
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    public func searchUsers(query: String) async throws -> SearchResponseDTO {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/users"
        components.queryItems = [URLQueryItem(name: "q", value: query)]
        
        guard let url = components.url else {
            throw DataError.invalidData("URL invalide")
        }
        
        do {
            return try await networkClient.request(url: url, method: .get)
        } catch {
            throw DataError.networkError(error)
        }
    }
    
    public func getUserDetails(login: String) async throws -> UserDetailsDTO {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/users/\(login)"
        
        guard let url = components.url else {
            throw DataError.invalidData("URL invalide")
        }
        
        do {
            return try await networkClient.request(url: url, method: .get)
        } catch {
            throw DataError.networkError(error)
        }
    }
}
