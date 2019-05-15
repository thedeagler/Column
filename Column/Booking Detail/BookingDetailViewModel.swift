//
//  BookingDetailViewModel.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

struct BookingDetailViewModel {
    let title: NSAttributedString
    let formattedAddress: NSAttributedString
    let formattedPhoneNumber: NSAttributedString
    let internationalPhoneNumber: InternationalPhoneNumber?
    let placeIcon: UIImage
    let placeName: NSAttributedString
}
