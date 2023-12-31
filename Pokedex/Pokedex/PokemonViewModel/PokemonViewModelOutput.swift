//
//  PokemonViewModelOutput.swift
//  pokeAPI
//
//  Created by Berkay Yaman on 3.11.2023.
//

import Foundation

protocol PokemonViewModelOutput: AnyObject {
    
    func updateView(name: String, id: Int, weight: Float, height: Float, types: [String], abilities: [String], stats: [String: Int],image: String )
    func updateViewDesc(desc: String)
    
}
