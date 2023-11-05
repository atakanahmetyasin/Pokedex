//
//  PokemonViewModel.swift
//  pokeAPI
//
//  Created by Berkay Yaman on 3.11.2023.
//

import Foundation

class PokemonViewModel {
    
    private let pokemonService: PokemonService
    weak var output: PokemonViewModelOutput?
    
    let mainUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
        
    }
    
    func fetchAll() {
        pokemonService.fetchData(from: mainUrl) { [weak self] (result: Result<PokemonMain, Error>) in
            switch result {
            case .success(let pokemonMain):
                
                if let range = pokemonMain.count {
                    for i in 1 ... 100 {
                        self?.fetchPokemonDetails(from: "\(self!.mainUrl)\(String(i))")
                    }
                    
                    
                }
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }

    private func fetchPokemonDetails(from url: String) {
        guard let pokemonURL = URL(string: url) else {
            print("Geçersiz URL")
            return
        }
        pokemonService.fetchData(from: pokemonURL) { [weak self] (result: Result<Pokemon, Error>) in
            switch result {
            case .success(let pokemon):
                self?.processPokemonData(pokemon)
                self?.fetchDesc(from: (pokemon.species?.url)!)
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }
    
    
//    private func fetchDesc(from url: String, completion: @escaping (String) -> Void) {
//        guard let pokemonDescURL = URL(string: url) else {
//            print("Geçersiz URL")
//            completion("")
//            return
//        }
//        pokemonService.fetchData(from: pokemonDescURL) { [weak self] (result: Result<PokeDesc, Error>) in
//            switch result {
//            case .success(let pokemon):
//                let desc = (pokemon.flavorTextEntries?[0].flavorText)!
//                completion(desc)
//            case .failure(let error):
//                print("Hata: (error)")
//                completion("")
//            }
//        }
//    }
    
    
    private func fetchDesc(from url: String) {
        guard let pokemonDescURL = URL(string: url) else {
            print("Geçersiz URL")
            return
        }
        pokemonService.fetchData(from: pokemonDescURL) { [weak self] (result: Result<PokeDesc, Error>) in
            switch result {
            case .success(let pokemonDesc):
                self?.processDescData(pokemonDesc)
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }
    
    private func processDescData(_ pokemonDesc: PokeDesc) {
        var desc: String = ""
        if let result = pokemonDesc.flavorTextEntries?[1].flavorText {
            desc = result.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\u{000C}", with: "")
        }
        self.output?.updateViewDesc(desc: desc)
    }

    private func processPokemonData(_ pokemon: Pokemon) {
        
        
        var typesArray: [String] = []
        if let types = pokemon.types {
            typesArray = types.compactMap { $0.type?.name }
        }
        
        
        var abilitiesArray: [String] = []
        if let abilities = pokemon.abilities {
            abilitiesArray = abilities.compactMap { $0.ability?.name }
        }
        
        
        var statsDictionary: [String: Int] = [:]
        if let stats = pokemon.stats {
            for stat in stats {
                if let statName = stat.stat?.name, let baseStat = stat.baseStat {
                    statsDictionary[statName] = baseStat
                }
            }
        }
        
        var image: String = ""
        if let frontDefault = pokemon.sprites?.other?.officialArtwork?.frontDefault {
            image = frontDefault
        }
        
        self.output?.updateView(name: pokemon.name ?? "Name not found",
                                id: pokemon.id ?? 0,
                                weight: Float(pokemon.weight ?? 0) / 10,
                                height: Float(pokemon.height ?? 0) / 10,
                                types: typesArray,
                                abilities: abilitiesArray,
                                stats: statsDictionary,
                                image: image
        )
    }
    

}
