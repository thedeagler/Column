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
        let places: [BookingResultViewModel] = results.map {
            let title = NSMutableAttributedString()
            var titleIcon: UIImage?
            if let type = $0.types.first {
                switch type {
                case .carRental: titleIcon = #imageLiteral(resourceName: "car-icon-filled")
                case .hotel: titleIcon = #imageLiteral(resourceName: "hotel-filled")
                }
            }
            title.append(NSAttributedString(string: $0.name))


            let description = NSAttributedString(string: $0.address)
            return BookingResultViewModel.init(id: $0.placeId, title: title, titleIcon: titleIcon, description: description)
        }

        view?.show(places: places)
    }

    func prepare(internationalNumber: String) {
        let number = internationalNumber
            .replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: "tel://\(number)") else {
            // handle error
            return
        }

        view?.call(url: url)
    }
}
