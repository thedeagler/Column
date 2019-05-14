//
//  Endpoint.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var base: String { get }
    var path: String { get }
    var components: URLComponents { get }
    var request: URLRequest { get }
    var url: URL { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var url: URL {
        return components.url!
    }

    var request: URLRequest {
        return URLRequest(url: url)
    }
}
