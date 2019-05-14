//
//  BookingResultTableViewCell.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingResultTableViewCell: UITableViewCell {

    private struct Constants {
        static let titleIconHeight: CGFloat = 33
        static let titleIconPadding: CGFloat = 4
    }

    @IBOutlet weak var textContainer: UIView!
    @IBOutlet weak var titleIcon: UIImageView?
    @IBOutlet weak var titleIconHeight: NSLayoutConstraint!
    @IBOutlet weak var titleIconPadding: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!

    func configure(for place: BookingResultViewModel) {
        if let icon = place.titleIcon {
            titleIcon?.image = icon
            showTitleIcon()
        } else {
            hideTitleIcon()
        }
        titleLabel.attributedText = place.title
        descriptionLabel.attributedText = place.description
    }

    func expand() {
        titleLabel.numberOfLines = 4
        descriptionLabel.numberOfLines = 2
    }

    func collapse() {
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 1
    }

    private func hideTitleIcon() {
        titleIconHeight.constant = 0
        titleIconPadding.constant = 0
    }

    private func showTitleIcon() {
        titleIconHeight.constant = Constants.titleIconHeight
        titleIconPadding.constant = Constants.titleIconPadding
    }
}
