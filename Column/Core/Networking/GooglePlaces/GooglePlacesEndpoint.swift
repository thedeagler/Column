//
//  GooglePlacesEndpoint.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct GooglePlacesEndpoint: Endpoint {
    let base = "maps.googleapis.com"
    let path: String
    let queryItems: [URLQueryItem]
    var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "Google Places API Key") as? String else {
            fatalError("Please follow the example in Column>Core>Config>secrets.example.xcconfig to create a secrets configuration file.")
        }

        return key
    }

    init(path: String, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.queryItems = queryItems
    }

    func adding(_ queryItem: URLQueryItem) -> GooglePlacesEndpoint {
        return GooglePlacesEndpoint(path: path, queryItems: queryItems.appending(queryItem))
    }

    func adding(_ queryItems: [URLQueryItem]) -> GooglePlacesEndpoint {
        return GooglePlacesEndpoint(path: path, queryItems: queryItems.appending(queryItems))
    }

    var components: URLComponents {
        var components = URLComponents()
        components.host = base
        components.scheme = scheme
        components.path = path
        components.queryItems = queryItems.appending(URLQueryItem(name: "key", value: apiKey))
        return components
    }
}
