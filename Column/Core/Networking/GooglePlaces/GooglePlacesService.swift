//
//  GooglePlacesService.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation


/// The service structs are responsible for making network requests and deserializing the responses.
struct GooglePlacesService {

    private struct Endpoints {
        static let search = "https://maps.googleapis.com/maps/api/place/textsearch/json"
        static let detail = "https://maps.googleapis.com/maps/api/place/details/json"
    }

    private let webservice: Webservice
    private let decoder = JSONDecoder()

    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "Google Places API Key") as! String

    init(webservice: Webservice = Webservice()) {
        self.webservice = webservice
    }

    /// Retrieve a list of places relevant to the given query
    ///
    /// - Parameters:
    ///   - query: The search term to match
    ///   - type: The kind of place to search for (hotel, car rental, etc)
    ///   - completion: Callback executed on response.
    func search(query: String, type: GooglePlaceType, completion: @escaping([GooglePlacesSearchResult], Error?) -> Void) {
        var components = URLComponents.init(string: Endpoints.search)!
        components.queryItems = queryItems(for: query, type: type)

        webservice.get(url: components.url!) { (data, response, error) in

            if let error = error {
                completion([], error) // Network error
            }

            if let data = data {
                do {
                    let response = try self.decoder.decode(GooglePlacesSearchResponse.self, from: data)
                    completion(response.results, nil)
                } catch {
                    completion([], error) // Decoding error
                }
            }
        }
    }

    func details(placeId: String) {

    }
}

private extension GooglePlacesService {
    struct Keys {
        static let query = "query"
        static let key = "key"
        static let type = "type"
        static let location = "location"
        static let radius = "radius"
    }

    func queryItems(for query: String, type: GooglePlaceType) -> [URLQueryItem] {
        return [
            URLQueryItem(name: Keys.location, value: "40.785276,-73.9651827"),
            URLQueryItem(name: Keys.radius, value: "50000"),
            URLQueryItem(name: Keys.query, value: query),
//            URLQueryItem(name: Keys.type, value: type.rawValue),
            URLQueryItem(name: Keys.key, value: apiKey)
        ]
    }
}

