//
//  Webservice.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import Foundation

struct Webservice {

    /// Makes a GET request to the specified url. Completion is called on the main thread once a
    /// response is received.
    ///
    /// - Parameters:
    ///   - url: The resource to request
    ///   - completion: Callback called upon server response.
    /// - Returns: The task handling this request
    @discardableResult
    func get(url: URL, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) -> URLSessionDataTask {
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }

        task.resume()
        return task
    }
}
