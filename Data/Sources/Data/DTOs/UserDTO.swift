//
//  UserDTO.swift
//  Data
//

import Foundation

/// DTO - Utilisateur (résumé) depuis l'API
public struct UserSummaryDTO: Decodable {
    public let id: Int
    public let login: String
    public let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
    }
}

/// DTO - Détails d'un utilisateur depuis l'API
public struct UserDetailsDTO: Decodable {
    public let id: Int
    public let login: String
    public let avatarUrl: String
    public let name: String?
    public let bio: String?
    public let followers: Int
    public let following: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case name
        case bio
        case followers
        case following
    }
}

/// DTO - Réponse de recherche
public struct SearchResponseDTO: Decodable {
    public let items: [UserSummaryDTO]
}
