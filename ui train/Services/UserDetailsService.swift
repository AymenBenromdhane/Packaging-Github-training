//
//  UserDetailsService.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation

protocol UserDetailsService {
    func fetchUserDetails(login: String) async throws -> UserDetails
}

class UserDetailsServiceImpl: UserDetailsService {
    var session: URLSession
    var decoder: JSONDecoder

    init(session: URLSession = .shared) {
        self.session = session
        decoder = JSONDecoder()
    }

    func fetchUserDetails(login: String) async throws -> UserDetails {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/users/\(login)"

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.setValue("ui-train", forHTTPHeaderField: "User-Agent")

        let (data, response) = try await session.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.httpStatus(http.statusCode)
        }

        do {
            let userDetails = try decoder.decode(UserDetails.self, from: data)
            return userDetails
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
