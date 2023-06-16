//
//  MusicMapper.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/16/23.
//

import Foundation

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
