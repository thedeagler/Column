//
//  BookingResultTableViewCell.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

protocol BookingResultCellDelegate: class {
    func didTapCall(id: String)
}

class BookingResultTableViewCell: UITableViewCell {

    var placeId: String!
    weak var delegate: BookingResultCellDelegate?

    @IBOutlet weak var textContainer: UIView!
    @IBOutlet weak var titleIcon: UIImageView?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBAction func didTapCall(_ sender: UIButton) {
        delegate?.didTapCall(id: placeId)
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
    }

    func expand() {
        titleLabel.numberOfLines = 4
        descriptionLabel.numberOfLines = 2
    }

    func collapse() {
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 1
    }
}
