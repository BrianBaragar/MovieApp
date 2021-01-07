//
//  Constants.swift
//  Movie App
//
//  Created by Brian Baragar on 21/12/20.
//

import Foundation
struct Constants {
    
    static let apiKey = "?api_key=7d9efac1aab30d6aaa45c1070996c127"
    
    struct URL {
        static let host = "https://api.themoviedb.org/"
        static let hostImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct EndPoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailMovie = "3/movie/"
    }
}
