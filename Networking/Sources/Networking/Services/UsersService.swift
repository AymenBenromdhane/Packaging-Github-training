//
//  UsersService.swift
//  Networking
//

import Foundation
import Entities

public protocol UsersService {
    func fetchUsers(query: String) async throws -> [UserSummary]
}

public final class UsersServiceImpl: UsersService {

    private let session: URLSession
    private let decoder: JSONDecoder

    public init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
    }

    public func fetchUsers(query: String) async throws -> [UserSummary] {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/users"
        components.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]

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
            let searchResponse = try decoder.decode(SearchResponse.self, from: data)
            return searchResponse.items
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
