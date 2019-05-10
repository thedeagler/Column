//
//  GooglePlacesService.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct GooglePlacesService: PlacesRequesting {
    private let webservice: Webservice

    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "Google Places API Key") as! String

    init(webservice: Webservice = Webservice()) {
        self.webservice = webservice
        print(apiKey)
    }

    func search(query: String, completion: @escaping([PlacesSearchResult], Error?) -> Void) {

    }
}

