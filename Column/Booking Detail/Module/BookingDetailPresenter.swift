//
//  BookingDetailPresenter.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingDetailPresenter {
    weak var view: BookingDetailViewController?

    func present(name: String, formattedAddress: String, formattedPhoneNumber: String, internationalPhoneNumber: String?, type: GooglePlaceType?) {

        let title = NSAttributedString(string: name)
        let address = NSAttributedString(string: formattedAddress)
        let phone = NSAttributedString(string: formattedPhoneNumber)

        var placeIcon: UIImage
        var placeName: String
        if let type = type {
            switch type {
            case .carRental:
                placeIcon = #imageLiteral(resourceName: "car-icon-filled")
                placeName = "Car Rental"
            case .hotel:
                placeIcon = #imageLiteral(resourceName: "hotel-filled")
                placeName = "Hotel"
            }
        } else {
            placeIcon = #imageLiteral(resourceName: "question-icon-filled")
            placeName = "Other"
        }

        let phoneNumber = internationalPhoneNumber.flatMap { InternationalPhoneNumber(phoneNumber: $0) }
        let viewModel = BookingDetailViewModel(title: title, formattedAddress: address, formattedPhoneNumber: phone, internationalPhoneNumber: phoneNumber, placeIcon: placeIcon, placeName: NSAttributedString(string: placeName))
        view?.show(place: viewModel)
    }

    func presentError(title: String? = nil, message: String? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if message == nil, title == nil {
            controller.title = "Whoops"
            controller.message = "Something went wrong."
        }

        view?.show(alert: controller)
    }
}
