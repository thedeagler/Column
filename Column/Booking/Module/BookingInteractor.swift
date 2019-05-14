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

    init(presenter: BookingPresenter,
         placesService: GooglePlacesService = GooglePlacesService()) {
        self.presenter = presenter
        self.placesService = placesService
    }

    func findPlaces(for query: String) {
        placesService.search(query: query) { [weak self] (results, error) in
            if let error = error {
                self?.presenter.present(error: error)
            } else {
                self?.presenter.present(results: results)
            }
        }
    }

    func getPhoneNumber(placeId: String) {
        placesService.getDetails(for: placeId) { [weak self] (detail, error) in
            if let error = error {
                self?.presenter.present(error: error)
            } else if let detail = detail {
                self?.presenter.prepare(internationalNumber: detail.internationalPhoneNumber, for: placeId)
            }
        }
    }
}
