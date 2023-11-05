//
//  Poke.swift
//  pokeAPI
//
//  Created by Berkay Yaman on 4.11.2023.
//

import Foundation

struct Poke {
    
    let name: String
    let id: Int
    let weight: Float
    let height: Float
    let types: [String]
    let abilities: [String]
    let stats: [String: Int]
    let image: String
    var desc: String = ""
    
}
