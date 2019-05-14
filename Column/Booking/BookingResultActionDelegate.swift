//
//  BookingResultActionDelegate.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

protocol BookingResultActionDelegate: class {
    func didTapCall(placeId: String)
    func navigateTo(placeId: String)
}
