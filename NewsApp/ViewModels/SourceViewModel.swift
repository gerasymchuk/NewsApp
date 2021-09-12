//
//  SourceViewModel.swift
//  NewsApp
//
//  Created by Misha on 08.09.2021.
//

import Foundation

struct SourceViewModel {
    let source: Source
    
    var name: String {
        return source.name ?? ""
    }
    var country: String {
        return source.country ?? ""
    }
    var category: String {
        return source.category ?? ""
    }
    var url: String {
        return source.url ?? ""
    }
}
