//
//  UserDetails.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation

struct UserDetails: Decodable {
    let id: Int
    let login: String
    let avatarUrl: URL
    let name: String?
    let bio: String?
    let followers: Int
    let following: Int

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
