//
//  BookingResultTableViewCell.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingResultTableViewCell: UITableViewCell {

    var placeId: String!
    weak var delegate: BookingResultActionDelegate?

    @IBOutlet weak var textContainer: UIView!
    @IBOutlet weak var titleIcon: UIImageView?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!

    @IBAction func didTapCall(_ sender: UIButton) {
        delegate?.didTapCall(placeId: placeId)
    }

    func configure(for place: BookingResultViewModel) {
        if let icon = place.titleIcon {
            titleIcon?.image = icon
        } else {
            titleIcon?.image = nil
        }
        titleIcon?.tintColor = place.titleIconTint
        titleLabel.attributedText = place.title
        descriptionLabel.attributedText = place.description
        placeId = place.id
        callButton.isEnabled = place.hasValidPhoneNumber
        callButton.tintColor = callButton.isEnabled ? contentView.tintColor : .lightGray
    }
}
