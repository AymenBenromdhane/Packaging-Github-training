//
//  SearchResponse.swift
//  Entities
//

import Foundation

public struct SearchResponse: Decodable {
    public let items: [UserSummary]
    
    public init(items: [UserSummary]) {
        self.items = items
    }
}
