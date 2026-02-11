//
//  UserDetails.swift
//  Entities
//

import Foundation

public struct UserDetails: Decodable {
    public let id: Int
    public let login: String
    public let avatarUrl: URL
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
