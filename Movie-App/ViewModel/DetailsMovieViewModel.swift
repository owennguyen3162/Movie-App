//
//  DetailsMovieViewModel.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 6/5/24.
//

import Foundation


class DetailsMovieViewModel {
    
    var movie : Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDes: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDes = movie.overview
        self.movieImage = makeImageURL(movie.posterPath)
    }
    
    private func makeImageURL (_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
