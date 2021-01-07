//
//  Movie.swift
//  Movie App
//
//  Created by Brian Baragar on 05/01/21.
//

import Foundation

struct Movie: Codable {
    let movieId: Int
    let title: String
    let popularity: Double
    let voteCount: Int
    let originalTitle: String
    let voteAverage: Double
    let sinopsis: String
    let releaseDate: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case title
        case popularity
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
    }
    
}
