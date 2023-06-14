//
//  HomeVM.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/14/23.
//

import Foundation

class HomeVM {
    // MARK: - properties
    var data: [Music] = []
    var dataCompletion: (([Music]) -> Void)?
    var errorCompletion: ((Error) -> Void)?
    let musicService = MusicService(client: URLSession.shared)
    
    // MARK: - fetch music
    func fetchMusic(by keyword: String) {
        Task {
            do {
                let musics = try await musicService.LoadAllMusic(for: keyword)
                data = musics
                dataCompletion?(musics)
            } catch {
                data = []
                dataCompletion?([])
                errorCompletion?(error)
            }
        }
    }
}
