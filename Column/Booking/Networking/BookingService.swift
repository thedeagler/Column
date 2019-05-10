//
//  BookingService.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct BookingService {
    private let webservice: Webservice

    init(webservice: Webservice = Webservice()) {
        self.webservice = webservice
    }

    func search(query: String, completion: @escaping([BookingSearchResult]) -> Void) {
        
    }
}
