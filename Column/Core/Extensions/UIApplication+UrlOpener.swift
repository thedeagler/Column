//
//  UIApplication+UrlOpener.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit
import Foundation

protocol URLOpener {
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
    func canOpenURL(_ url: URL) -> Bool
}

extension UIApplication: URLOpener {}
