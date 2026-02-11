//
//  UserSummary.swift
//  Entities
//

import Foundation

public struct UserSummary: Identifiable, Decodable {
    public let id: Int
    public let login: String
    public let avatarUrl: URL

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
    }
    
    public init(id: Int, login: String, avatarUrl: URL) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
