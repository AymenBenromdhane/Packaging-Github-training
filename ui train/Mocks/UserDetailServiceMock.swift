//
//  UserDetailServiceMock.swift
//  ui train
//
//  Created by Ben Romdhane on 10/02/2026.
//

import Foundation

final class UserDetailServiceMock: UserDetailsService {
    func fetchUserDetails(login: String) async throws -> UserDetails {
        return UserDetails(id: 1, login: "", avatarUrl: URL(string: "https://example.com/avatar.png")!, name: "Aymen", bio: "iOS Developer", followers: 2000, following: 1000)
    }
}
