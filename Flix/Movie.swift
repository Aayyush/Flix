//
//  Movie.swift
//  Flix
//
//  Created by Aayush  Gupta on 3/4/18.
//  Copyright © 2018 Aayush Gupta. All rights reserved.
//

import Foundation

class Movie{
    var title: String
    var overview: String
    var posterUrl: URL?
    var backDropURL: URL?
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No Overview"
        releaseDate = dictionary["release_date"] as? String ?? "Release Date Unknown"
        let posterPathString = dictionary["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        posterUrl = URL(string: baseURLString+posterPathString)!
        let backdropPathString = dictionary[MovieKeys.backdropPath] as! String
        backDropURL = URL(string: baseURLString+backdropPathString)!
        
        
    
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
