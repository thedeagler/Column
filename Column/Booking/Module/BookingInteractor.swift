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
    private let service: BookingService

    init(presenter: BookingPresenter, service: BookingService = BookingService()) {
        self.presenter = presenter
        self.service = service
    }
}
