//
//  MainViewModel.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import Foundation

class MainViewModel {
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData() {
        APICaller.getTrendingMovies{ result in
            switch result {
            case .success(let data):
                print("\(data.results.count)")
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
