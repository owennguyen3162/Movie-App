//
//  MovieTableCellViewModel.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 6/5/24.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie){
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteCount)/10"
        self.imageUrl = makeImageUrl(movie.posterPath)
    }

    private func makeImageUrl (_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
