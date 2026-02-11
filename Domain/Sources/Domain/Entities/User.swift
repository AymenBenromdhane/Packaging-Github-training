//
//  User.swift
//  Domain
//

import Foundation

/// Entité métier - Utilisateur (résumé)
public struct User: Identifiable, Equatable {
    public let id: Int
    public let login: String
    public let avatarUrl: URL
    
    public init(id: Int, login: String, avatarUrl: URL) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}

/// Entité métier - Détails d'un utilisateur
public struct UserDetail: Equatable {
    public let id: Int
    public let login: String
    public let avatarUrl: URL
    public let name: String?
    public let bio: String?
    public let followers: Int
    public let following: Int
    
    public init(
        id: Int,
        login: String,
        avatarUrl: URL,
        name: String?,
        bio: String?,
        followers: Int,
        following: Int
    ) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
        self.name = name
        self.bio = bio
        self.followers = followers
        self.following = following
    }
}
