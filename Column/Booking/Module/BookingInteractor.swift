//
//  BookingInteractor.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

/// The interactor handles data-related work. In this case, the interactor initiates requests via
/// the google places service, and triages the responses to be manipulated by the presenter.
class BookingInteractor {
    private let presenter: BookingPresenter
    private let placesService: GooglePlacesService

    private struct Constants {
        static let defaultGooglePlaceTypes: [GooglePlaceType] = [.carRental, .hotel]
    }

    init(presenter: BookingPresenter, placesService: GooglePlacesService = GooglePlacesService()) {
        self.presenter = presenter
        self.placesService = placesService
    }

    func findPlaces(for query: String) {
        placesService.search(query: query, type: .hotel) { [weak self] (results, error) in
            if let error = error {
                // handler error
            } else {
                self?.presenter.present(results: results)
            }
        }
    }

    func getPhoneNumber(placeId: String) {
        
    }
}
