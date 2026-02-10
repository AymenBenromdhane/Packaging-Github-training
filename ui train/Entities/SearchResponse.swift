//
//  SearchResponse.swift
//  ui train
//
//  Created by Ben Romdhane on 04/02/2026.
//

import Foundation

struct SearchResponse: Decodable {
    let items: [UserSummary]
}
