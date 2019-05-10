//
//  UIView+Constrain.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

extension UIView {
    /// Embeds a child view
    ///
    /// - Parameters:
    ///   - child: the subview to contain
    ///   - insets: padding between the subview and the view
    func embed(_ child: UIView, insets: UIEdgeInsets = .zero) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        child.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left).isActive = true
        child.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right).isActive = true
        child.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        child.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).isActive = true
    }
}
