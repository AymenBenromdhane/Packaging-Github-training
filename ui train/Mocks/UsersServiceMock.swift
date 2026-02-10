//
//  UsersServiceMock.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation

final class UsersServiceMock: UsersService {
    func fetchUsers(query: String) async throws -> [UserSummary] {
        return [
            UserSummary(id: 1, login: "aymen", avatarUrl: URL(string: "https://example.com")!)
        ]
    }
}
