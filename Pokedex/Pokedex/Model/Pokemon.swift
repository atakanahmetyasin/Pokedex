


import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let abilities: [Ability]?
    let height: Int?
    let id: Int?
    let name: String?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
    let desc: String?

    enum CodingKeys: String, CodingKey {
        case abilities
        case height
        case id
        case name
        case species, sprites, stats, types, weight
        case desc
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}



 //MARK: - Sprites

class Sprites: Codable {
    
    let other: Other?

    enum CodingKeys: String, CodingKey {
        
        case other
    }

    init(other: Other?) {
        self.other = other
    }
}


// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}


// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: Species?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {}

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

