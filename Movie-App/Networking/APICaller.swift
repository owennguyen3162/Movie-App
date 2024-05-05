//
//  APICaller.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            dataResponse, urlResponse, error in
            if error == nil {
                    if let data = dataResponse {
                        do {
                            let resultData = try JSONDecoder().decode(TrendingMoviesModel.self, from: data)
                            completionHandler(.success(resultData))
                        } catch {
                            completionHandler(.failure(.canNotParseData))
                        }
                    } else {
                        completionHandler(.failure(.canNotParseData))
                    }
                } else {
                    completionHandler(.failure(.canNotParseData))
                }
            
        }.resume()
    }
}
