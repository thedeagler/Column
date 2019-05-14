//
//  BookingResultViewModel.swift
//  Column
//
//  Created by Stephen Wu on 5/13/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

/// Internal representation of a result shown on the Booking screen.
struct BookingResultViewModel {
    /// Result's unique identifier. Typically used to make follow up requests.
    let id: String
    /// Text to show as primary text in the result cell
    let title: NSAttributedString
    /// Icon to display for this type of result
    let titleIcon: UIImage?
    /// The color of the title icon
    let titleIconTint: UIColor = .lightGray
    /// Text to show as the secondary text in the result cell
    let description: NSAttributedString

    /// Whether or not the place has a phone number that can be called.
    let hasValidPhoneNumber: Bool

    init(id: String,
         title: NSAttributedString,
         titleIcon: UIImage?,
         description: NSAttributedString,
         hasValidPhoneNumber: Bool = true) {

        self.id = id
        self.title = title
        self.titleIcon = titleIcon
        self.description = description
        self.hasValidPhoneNumber = hasValidPhoneNumber
    }

    /// Creates a copy of the view model where the phone number is not valid
    func invalidatingPhoneNumber() -> BookingResultViewModel {
        return BookingResultViewModel(id: id, title: title, titleIcon: titleIcon, description: description, hasValidPhoneNumber: false)
    }
}
