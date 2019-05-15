//
//  BookingDetailInteractor.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

class BookingDetailInteractor {
    private let placeId: String

    private let presenter: BookingDetailPresenter
    private let placesService: GooglePlacesService

    init(presenter: BookingDetailPresenter, placeId: String, placesService: GooglePlacesService = GooglePlacesService()) {
        self.presenter = presenter
        self.placeId = placeId
        self.placesService = placesService
    }

    func getInitialData() {
        let detailFields: [GooglePlaceDetailField] = [
            .placeId,
            .type,
            .name,
            .formattedAddress,
            .internationalPhoneNumber,
            .formattedPhoneNumber
        ]
        
        placesService.getDetails(for: placeId, fields: detailFields) { [weak self] (detail, error) in
            if let error = error {
                self?.presenter.presentError(title: "Network Error", message: error.localizedDescription)
            } else if let detail = detail {
                guard let name = detail.name,
                    let formattedAddress = detail.formattedAddress else {
                        self?.presenter.presentError()
                        return
                }

                let formattedPhoneNumber = detail.formattedPhoneNumber ?? "None"
                self?.presenter.present(name: name, formattedAddress: formattedAddress, formattedPhoneNumber: formattedPhoneNumber, internationalPhoneNumber: detail.internationalPhoneNumber, type: detail.types.first)
            }
        }
    }
}
