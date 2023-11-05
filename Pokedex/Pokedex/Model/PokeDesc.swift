//
//  PokeDesc.swift
//  pokeAPI
//
//  Created by Berkay Yaman on 4.11.2023.
//

import Foundation

// MARK: - PokeDesc
struct PokeDesc: Codable {
    let flavorTextEntries: [FlavorTextEntry]?

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
    }
}

