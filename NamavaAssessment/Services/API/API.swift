//
//  API.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/14/23.
//

import Foundation
struct InvalidHTTPResponseError: Error {}

class API {
    
}

extension API {
    static let baseUrl: String = "https://itunes.apple.com/search"
}

protocol HttpClient {
    func publisher(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}

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

class MusicService {
    let client: HttpClient
    
    init(client: HttpClient) {
        self.client = client
    }
    
    func LoadAllMusic(for keyword: String) async throws -> [Music] {
        let musics: [Music] = try await withCheckedThrowingContinuation {[client] continuation in
            guard let request =  MusicService.makeRequest(for: keyword) else {
                continuation.resume(throwing: InvalidHTTPResponseError())
                return
            }
            client.publisher(request: request) { result in
                switch result {
                case .success(let success):
                    do {
                        continuation.resume(returning: try MusicDataMapper.mapper(data: success.0, response: success.1))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
        
        return musics
    }
}

struct MusicDataMapper {
    static func mapper(data: Data, response: HTTPURLResponse) throws -> [Music] {
        if response.statusCode == 204 {
            return []
        }
        
        if response.statusCode == 200 {
            do {
                let musics = try JSONDecoder().decode(AppleResult.self, from: data).results
                return musics
            } catch {
                throw error
            }
        }
        
        // handle other status codes
        return []
    }
}
extension MusicService {
    //https://itunes.apple.com/search?term=jack&country=DE&media=music
    static func makeRequest(for keyword: String) -> URLRequest? {
        guard var urlComponent = URLComponents(string:  API.baseUrl) else {
            return nil
        }
        urlComponent.queryItems = [
            URLQueryItem(name: "term", value: keyword),
            URLQueryItem(name: "country", value: "DE"),
            URLQueryItem(name: "media", value: "music"),
        ]
        guard let url = urlComponent.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
