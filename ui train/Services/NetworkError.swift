//
//  NetworkError.swift
//  ui train
//
//  Created by Ben Romdhane on 10/02/2026.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpStatus(Int)
    case decoding(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL invalide."
        case .invalidResponse:
            return "Réponse serveur invalide."
        case .httpStatus(let code):
            return "Erreur serveur (HTTP \(code))."
        case .decoding:
            return "Impossible de lire la réponse."
        }
    }
}
