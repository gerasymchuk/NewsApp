//
//  Endpoint.swift
//  NewsApp
//
//  Created by Misha on 06.09.2021.
//

import Foundation

enum Endpoint {
    case topHeadLines
    case articlesFromCategory(_ categories: String)
    case articlesFromSource(_ source: String)
    case search(searchFilter: String)
    case sources
    
    var baseURL: URL {
        URL(string: "https://newsapi.org/v2/")!
    }
    
    func path() -> String {
        switch self {
        case .topHeadLines, .articlesFromCategory:
            return "top-headlines"
        case .search, .articlesFromSource:
            return "everything"
        case .sources:
            return "top-headlines/sources"
        }
    }
    
    var absoluteURL: URL? {
        let queryURL = baseURL.appendingPathComponent(self.path())
        let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        guard var urlComponents = components else {
            return nil
        }
        switch self {
        case .topHeadLines:
            urlComponents.queryItems = [URLQueryItem(name: "country", value: "us"),
                                        URLQueryItem(name: "apiKey", value: APIKey.key)]
        case .articlesFromCategory(let category):
            urlComponents.queryItems = [URLQueryItem(name: "category", value: category),
                                        URLQueryItem(name: "apiKey", value: APIKey.key)]
        case .articlesFromSource(let source):
            urlComponents.queryItems = [URLQueryItem(name: "source", value: source),
                                        URLQueryItem(name: "apiKey", value: APIKey.key)]
        case .sources:
            urlComponents.queryItems = [URLQueryItem(name: "apiKey", value: APIKey.key)]
        case .search(let searchFilter):
            urlComponents.queryItems = [URLQueryItem(name: "q", value: searchFilter.lowercased()),
                                        URLQueryItem(name: "apiKey", value: APIKey.key)]
            
        }
        return urlComponents.url
    }
}
