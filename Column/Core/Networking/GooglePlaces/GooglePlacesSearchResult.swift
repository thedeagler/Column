//
//  GooglePlacesSearchResult.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct GooglePlacesSearchResult: Codable {
    let placeId: String
    let name: String
    let address: String
    let types: [GooglePlaceType]

    enum CodingKeys: String, CodingKey {
        case placeId = "place_id"
        case name
        case address = "formatted_address"
        case types = "types"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        placeId = try container.decode(String.self, forKey: .placeId)
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        let rawTypes = try container.decode([String].self, forKey: .types)
        types = rawTypes.compactMap(GooglePlaceType.init(rawValue:))
    }
}
