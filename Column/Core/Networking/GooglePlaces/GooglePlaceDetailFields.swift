//
//  GooglePlaceDetailFields.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

enum GooglePlaceDetailField: String {
    case placeId = "place_id"
    case type
    case name
    case formattedAddress = "formatted_address"
    case formattedPhoneNumber = "formatted_phone_number"
    case internationalPhoneNumber = "international_phone_number"
}
