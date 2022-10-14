//
//  MovieListEntity.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import Foundation

struct MovieListEntity: Codable {
    let results: [MovieResults]
}

struct MovieResults: Codable {
    let title: String?
    let description: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "overview"
        case poster = "poster_path"
    }
}
