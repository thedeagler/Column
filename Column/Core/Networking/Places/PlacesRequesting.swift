//
//  PlacesRequesting.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

protocol PlacesRequesting {
    
    /// Retrieve a list of places relevant to the given query
    ///
    /// - Parameters:
    ///   - query: The search term to match
    ///   - completion: Callback executed on response.
    func search(query: String, completion: @escaping([PlacesSearchResult], Error?) -> Void)
}
