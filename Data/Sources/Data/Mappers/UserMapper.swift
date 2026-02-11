//
//  UserMapper.swift
//  Data
//

import Foundation
import Domain

/// Mapper - DTO vers Domain Entity
public enum UserMapper {
    
    public static func toDomain(_ dto: UserSummaryDTO) throws -> User {
        guard let avatarUrl = URL(string: dto.avatarUrl) else {
            throw DataError.invalidData("URL de l'avatar invalide")
        }
        
        return User(
            id: dto.id,
            login: dto.login,
            avatarUrl: avatarUrl
        )
    }
    
    public static func toDomain(_ dto: UserDetailsDTO) throws -> UserDetail {
        guard let avatarUrl = URL(string: dto.avatarUrl) else {
            throw DataError.invalidData("URL de l'avatar invalide")
        }
        
        return UserDetail(
            id: dto.id,
            login: dto.login,
            avatarUrl: avatarUrl,
            name: dto.name,
            bio: dto.bio,
            followers: dto.followers,
            following: dto.following
        )
    }
}
