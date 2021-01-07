//
//  Movies.swift
//  Movie App
//
//  Created by Brian Baragar on 05/01/21.
//

import Foundation

struct Movies: Codable {
    let listOfMovies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
    }
}

