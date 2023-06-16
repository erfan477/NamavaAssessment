//
//  HttpClient.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/16/23.
//

import Foundation

protocol HttpClient {
    func publisher(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
