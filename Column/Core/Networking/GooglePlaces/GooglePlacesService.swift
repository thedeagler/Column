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

    enum Query: String {
        // Search request query keys
        case query = "query"
        case key = "key"
        case location = "location"
        case radius = "radius"

        // Detail request query keys
        case fields = "fields"
        case placeId = "placeid"

        func item(value: String) -> URLQueryItem {
            return URLQueryItem(name: self.rawValue, value: value)
        }
    }

    private struct Endpoint {
        static let search = GooglePlacesEndpoint(path: "/maps/api/place/textsearch/json")
        static let detail = GooglePlacesEndpoint(path: "/maps/api/place/details/json")
    }

    private let webservice: Webservice
    private let decoder: JSONDecoder

    init(webservice: Webservice = Webservice(), decoder: JSONDecoder = JSONDecoder()) {
        self.webservice = webservice
        self.decoder = decoder
    }

    /// Retrieve a list of places relevant to the given query
    ///
    /// - Parameters:
    ///   - query: The search term to match
    ///   - type: The kind of place to search for (hotel, car rental, etc)
    ///   - completion: Callback executed on response.
    func search(query: String, completion: @escaping([GooglePlacesSearchResult], Error?) -> Void) {
        let url = Endpoint.search
            .adding([
                Query.location.item(value: "40.785276,-73.9651827"),
                Query.radius.item(value: "50000"),
                Query.query.item(value: query)
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
    func getDetails(for placeId: String, fields: [GooglePlaceDetailField], completion: @escaping (GooglePlacesDetail?, Error?) -> Void) {
        let url = Endpoint.detail
            .adding([
                Query.fields.item(value: fields.map { $0.rawValue }.joined(separator: ",")),
                Query.placeId.item(value: placeId)
            ])
            .url

        webservice.get(url: url) { (data, response, error) in

            if let error = error {
                completion(nil, error) // Network error
            }

            if let data = data {
                do {
                    let response = try self.decoder.decode(GooglePlacesDetailResponse.self, from: data)
                    completion(response.result, nil)
                } catch {
                    completion(nil, error) // Decoding error
                }
            }
        }
    }
}
