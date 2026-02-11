//
//  DataError.swift
//  Data
//

import Foundation

/// Erreurs de la couche Data
public enum DataError: Error, LocalizedError {
    case invalidData(String)
    case networkError(Error)
    
    public var errorDescription: String? {
        switch self {
        case .invalidData(let message):
            return "Données invalides : \(message)"
        case .networkError(let error):
            return "Erreur réseau : \(error.localizedDescription)"
        }
    }
}
