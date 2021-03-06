//
//  BookingDetailModule.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

class BookingDetailModule {
    let interactor: BookingDetailInteractor
    let presenter: BookingDetailPresenter
    let viewController: BookingDetailViewController

    init(placeId: String) {
        presenter = BookingDetailPresenter()
        interactor = BookingDetailInteractor(presenter: presenter, placeId: placeId)
        viewController = BookingDetailViewController(interactor: interactor)
        presenter.view = viewController
    }
}
