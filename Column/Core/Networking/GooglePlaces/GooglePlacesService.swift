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

    struct QueryKey {
        static let query = "query"
        static let key = "key"
        static let type = "type"
        static let location = "location"
        static let radius = "radius"
    }

    private struct Endpoint {
        static let search = GooglePlacesEndpoint(path: "/maps/api/place/textsearch/json")
        static let detail = GooglePlacesEndpoint(path: "/maps/api/place/details/json")
    }

    private let webservice: Webservice
    private let decoder = JSONDecoder()

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
        let url = Endpoint.search
            .adding([
                URLQueryItem(name: QueryKey.location, value: "40.785276,-73.9651827"),
                URLQueryItem(name: QueryKey.radius, value: "50000"),
                URLQueryItem(name: QueryKey.query, value: query),
                URLQueryItem(name: QueryKey.type, value: type.rawValue)
            ])
            .url

        webservice.get(url: url) { (data, response, error) in

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

    /// Retrieves the details about a place by ID. We only need the phone number here, but we can
    /// get a lot more.
    func details(placeId: String) {

    }
}
