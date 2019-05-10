//
//  BookingResultTableViewCell.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingResultTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func expand() {
        titleLabel.numberOfLines = 4
        descriptionLabel.numberOfLines = 2
    }

    func collapse() {
        titleLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 2
    }
    
}
