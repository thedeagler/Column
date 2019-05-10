//
//  BookingModule.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

class BookingModule {
    let interactor: BookingInteractor
    let presenter: BookingPresenter
    let viewController: BookingViewController

    init() {
        viewController = .init()
        presenter = .init(view: viewController)
        interactor = .init(presenter: presenter)
        viewController.interactor = interactor
    }
}
