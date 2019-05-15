//
//  BookingPresenter.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

/*
 The presenter is responsible for manipulating the raw data into presentable view models
 to be shown to the user
 */
class BookingPresenter {
    weak var view: BookingViewController?

    func present(results: [GooglePlacesSearchResult]) {
        guard !results.isEmpty else {
            view?.showInstructionOverlay()
            presentAlert(title: "No results", message: "Try a different query.")
            return
        }

        let places: [BookingResultViewModel] = results.map {
            var titleIcon: UIImage?
            if let type = $0.types.first {
                switch type {
                case .carRental: titleIcon = #imageLiteral(resourceName: "car-icon-filled")
                case .hotel: titleIcon = #imageLiteral(resourceName: "hotel-filled")
                }
            }
            let title = NSAttributedString(string: $0.name)
            let description = NSAttributedString(string: $0.address)
            return BookingResultViewModel.init(id: $0.placeId, title: title, titleIcon: titleIcon, description: description)
        }
        
        view?.show(places: places)
    }

    func present(error: Error) {
        presentAlert(title: "Whoops", message: error.localizedDescription)
    }

    func prepare(internationalNumber: String?, for placeId: String) {
        guard let number = internationalNumber else {
            view?.disableCalling(for: placeId)
            presentAlert(title: "Whoops", message: "This location does not have a valid phone number. Please try another location.")
            return
        }

        view?.call(phoneNumber: InternationalPhoneNumber(phoneNumber: number))
    }

    func presentAlert(title: String? = nil, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okie Dokie", style: .default, handler: nil)
        controller.addAction(okAction)
        view?.show(alert: controller)
    }
}
