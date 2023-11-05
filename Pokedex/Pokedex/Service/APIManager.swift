//
//  APIManager.swift
//  pokeAPI
//
//  Created by Berkay Yaman on 3.11.2023.
//

import Foundation

class APIManager: PokemonService {
    
    func fetchData<T: Codable>(from url: URL, completion: @escaping (Result<T,Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError()))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
