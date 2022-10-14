//
//  Constants.swift
//  Test-TheMovieApp
//
//  Created by Victor De la Torre on 13/10/22.
//

import Foundation

struct Constants {
    static let apiKey = "?api_key=6a137677e99cc72f4d88398b1a69cdbb"
    static let baseUrl = "https://api.themoviedb.org/"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w200"
    static let popularUrl = baseUrl + EndPoints.popularMovies.rawValue + apiKey
    static let movieDetailUrl = baseUrl + EndPoints.movieDetail.rawValue + apiKey
}

enum EndPoints: String {
    case popularMovies = "3/movie/popular"
    case movieDetail = "3/movie/"
}
