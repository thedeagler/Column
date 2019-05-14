//
//  GooglePlaceTypes.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

/// Types of google-recognized places to refine a places search
/// https://developers.google.com/places/web-service/supported_types
enum GooglePlaceType: String, Codable {
    case carRental = "car_rental"
    case hotel = "lodging"
}
