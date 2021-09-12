//
//  NewsResponseViewModel.swift
//  NewsApp
//
//  Created by Misha on 07.09.2021.
//

import Foundation

class NewsResponseViewModel {
    
    var articleVM = [ArticleViewModel]()
    var sourceVM = [SourceViewModel]()
    
    func getArticle(copmletion: @escaping ([ArticleViewModel]) -> Void) {
        NetworkManager.shared.getArticle(from: .topHeadLines) { result in
            switch result {
            case .success(let article):
                let articleVM = article.map(ArticleViewModel.init)
                self.articleVM = articleVM
                copmletion(articleVM)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSource(copmletion: @escaping ([SourceViewModel]) -> Void) {
        NetworkManager.shared.getSource(from: .sources) { result in
            switch result {
            case .success(let source):
                let sourceVM = source.map(SourceViewModel.init)
                self.sourceVM = sourceVM
                copmletion(sourceVM)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func search(with query: String, copmletion: @escaping ([ArticleViewModel]) -> Void) {
        NetworkManager.shared.getArticle(from: .search(searchFilter: query)) { result in
            switch result {
            case .success(let article):
                let articleVM = article.map(ArticleViewModel.init)
                self.articleVM = articleVM
                copmletion(articleVM)
            case .failure(let error):
                print(error)
            }
        }
    }
}
