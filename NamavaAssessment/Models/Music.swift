//
//  Musics.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/14/23.
//

import Foundation

// MARK: - Welcome
struct AppleResult: Decodable {
    let resultCount: Int?
    let results: [Music]
}

// MARK: - Result
struct Music: Decodable {
    let artistID, collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL, artworkUrl30: String?
    let releaseDate: String?
    let trackTimeMillis: Int?
    let collectionArtistName: String?
}
