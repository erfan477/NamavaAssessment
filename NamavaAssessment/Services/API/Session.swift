//
//  Session.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/16/23.
//

import Foundation

extension URLSession: HttpClient {
    func publisher(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(InvalidHTTPResponseError()))
                return
            }
            completion(.success((data, response)))
        }.resume()
    }
}
