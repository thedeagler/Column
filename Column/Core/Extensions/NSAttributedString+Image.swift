//
//  NSAttributedString+Image.swift
//  Column
//
//  Created by Stephen Wu on 5/13/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

extension NSAttributedString {
    convenience init(image: UIImage) {
        let attachment = NSTextAttachment()
        attachment.image = image
        self.init(attachment: attachment)
    }
}
