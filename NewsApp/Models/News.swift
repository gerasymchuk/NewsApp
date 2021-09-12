//
//  News.swift
//  NewsApp
//
//  Created by Misha on 06.09.2021.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let articles: [Article]?
    let sources: [Source]?
}

struct Article: Codable {
    let title: String?
    let description: String?
    let author: String?
    let url: String
    let urlToImage: String?
    let source: Source?
}

struct Source: Codable,Identifiable {
    let id: String?
    let name: String?
    let country: String?
    let category: String?
    let url: String?
}
