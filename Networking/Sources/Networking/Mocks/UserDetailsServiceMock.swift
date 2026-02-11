//
//  UserDetailsServiceMock.swift
//  Networking
//

import Foundation
import Entities

public final class UserDetailsServiceMock: UserDetailsService {
    public init() {}
    
    public func fetchUserDetails(login: String) async throws -> UserDetails {
        return UserDetails(
            id: 1,
            login: login,
            avatarUrl: URL(string: "https://example.com/avatar.png")!,
            name: "Aymen",
            bio: "iOS Developer",
            followers: 2000,
            following: 1000
        )
    }
}
