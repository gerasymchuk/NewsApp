//
//  ArticlesViewModel.swift
//  NewsApp
//
//  Created by Misha on 07.09.2021.
//

import Foundation

struct ArticleViewModel {
    let article: Article
    
    var title: String {
        return article.title ?? ""
    }
    var description: String {
        return article.description ?? ""
    }
    var author: String {
        return article.author ?? ""
    }
    var url: String {
        return article.url
    }
    var urlToImage: String {
        return article.urlToImage ?? ""
    }
    var source: String {
        return article.source?.name ?? ""
    }
}
