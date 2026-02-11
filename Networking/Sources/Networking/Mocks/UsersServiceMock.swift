//
//  UsersServiceMock.swift
//  Networking
//

import Foundation
import Entities

public final class UsersServiceMock: UsersService {
    public init() {}
    
    public func fetchUsers(query: String) async throws -> [UserSummary] {
        return [
            UserSummary(id: 1, login: "aymen", avatarUrl: URL(string: "https://example.com")!)
        ]
    }
}
