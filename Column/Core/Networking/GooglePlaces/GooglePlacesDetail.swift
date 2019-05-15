//
//  GooglePlacesDetail.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct GooglePlacesDetail: Codable {
    let id: String
    let name: String?
    let formattedPhoneNumber: String?
    let internationalPhoneNumber: String?
    let formattedAddress: String?
    let types: [GooglePlaceType]

    enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case name
        case formattedPhoneNumber = "formatted_phone_number"
        case internationalPhoneNumber = "international_phone_number"
        case formattedAddress = "formatted_address"
        case types
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        formattedPhoneNumber = try? container.decode(String.self, forKey: .formattedPhoneNumber)
        internationalPhoneNumber = try? container.decode(String.self, forKey: .internationalPhoneNumber)
        formattedAddress = try? container.decode(String.self, forKey: .formattedAddress)
        if let rawTypes = try? container.decode([String].self, forKey: .types) {
            types = rawTypes.compactMap(GooglePlaceType.init(rawValue:))
        } else {
            types = []
        }
    }
}
