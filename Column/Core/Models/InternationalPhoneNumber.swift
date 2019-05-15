//
//  InternationalPhoneNumber.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

/// An international phone number is a universal phone number which includes the country code.
/// as well as the local digits
struct InternationalPhoneNumber {
    let rawValue: String

    /// Used to place phone calls
    private let urlOpener: URLOpener

    init(phoneNumber: String, urlOpener: URLOpener = UIApplication.shared) {
        rawValue = phoneNumber
        self.urlOpener = urlOpener
    }

    var url: URL? {
        return URL(string: "tel://\(rawValue.replacingOccurrences(of: " ", with: ""))")
    }

    func initiateCall(onSuccess: ((Bool) -> Void)? = nil, onFailure: (() -> Void)? = nil) {
        guard let url = url, urlOpener.canOpenURL(url) else {
            onFailure?()
            return
        }

        urlOpener.open(url, options: [:], completionHandler: onSuccess)
    }
}
