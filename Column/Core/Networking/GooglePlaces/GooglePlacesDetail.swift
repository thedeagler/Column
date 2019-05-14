//
//  GooglePlacesDetail.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct GooglePlacesDetail: Codable {
    var formattedPhoneNumber: String?
    var internationalPhoneNumber: String?

    enum CodingKeys: String, CodingKey {
        case formattedPhoneNumber = "formatted_phone_number"
        case internationalPhoneNumber = "international_phone_number"
    }
}
