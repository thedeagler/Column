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
    /// Text to show as the secondary text in the result cell
    let description: NSAttributedString
    /// Whether or not the cell should be expanded to show more lines of text.
    let isExpanded: Bool

    /// Creates a copy of the view model where `isExpanded` is opposite of the current value.
    func sizeToggled() -> BookingResultViewModel {
        return BookingResultViewModel(id: id, title: title, titleIcon: titleIcon, description: description, isExpanded: !isExpanded)
    }

    init(id: String,
         title: NSAttributedString,
         titleIcon: UIImage?,
         description: NSAttributedString,
         isExpanded: Bool = false) {

        self.id = id
        self.title = title
        self.titleIcon = titleIcon
        self.description = description
        self.isExpanded = isExpanded
    }
}
