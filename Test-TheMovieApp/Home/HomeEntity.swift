//
//  HomeEntity.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import Foundation

struct HomeEntity: Codable {
    let title: String?
//    let description: String?
//    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title
//        case description = "overview"
//        case poster = "poster_path"
    }
}
