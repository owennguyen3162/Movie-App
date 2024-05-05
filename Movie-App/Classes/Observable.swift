//
//  Observable.swift
//  Movie-App
//
//  Created by Nguyen Anh Tuan on 5/5/24.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init( _ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ lis: @escaping ((T?) -> Void)) {
        lis(value)
        self.listener = lis
    }
    
}
