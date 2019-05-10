//
//  UIView+Nib.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

extension UIView {
    /// Instantiates a new nib
    static func nib() -> UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }
}
