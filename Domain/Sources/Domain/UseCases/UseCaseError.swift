//
//  UseCaseError.swift
//  Domain
//

import Foundation

/// Erreurs métier des Use Cases
public enum UseCaseError: Error, LocalizedError {
    case invalidInput(String)
    case businessRuleViolation(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidInput(let message):
            return message
        case .businessRuleViolation(let message):
            return message
        }
    }
}
