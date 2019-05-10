//
//  BookingInteractor.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

class BookingInteractor {
    private let presenter: BookingPresenter
    private let placesService: PlacesRequesting

    init(presenter: BookingPresenter, placesService: PlacesRequesting = GooglePlacesService()) {
        self.presenter = presenter
        self.placesService = placesService
    }
}
