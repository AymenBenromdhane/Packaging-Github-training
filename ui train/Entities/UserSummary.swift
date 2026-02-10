//
//  UserSummary.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation

struct UserSummary: Identifiable, Decodable {
    let id: Int
    let login: String
    let avatarUrl: URL

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
    }
}
