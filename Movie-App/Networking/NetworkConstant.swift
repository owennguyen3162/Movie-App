//
//  NetworkConstant.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant  = NetworkConstant()
    
    private init() {
        //Singletone
    }
    
    public var apiKey: String {
        get {
            //API key
            return "91540bd9c5f66b73ecfbef341a5bcd5f"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
