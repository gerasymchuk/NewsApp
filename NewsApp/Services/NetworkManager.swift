//
//  NewsAPI.swift
//  NewsApp
//
//  Created by Misha on 07.09.2021.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func performRequest(with url: URL, completion: @escaping (Result<NewsResponse, APIError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error as! APIError))
                return
            }
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(.responseUnsuccessful))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                if newsResponse.status == "ok" {
                    completion(.success(newsResponse))
                } else {
                    completion(.failure(.requestFailed))
                }
            } catch {
                completion(.failure(.jsonDecodeFailure))
            }
        }.resume()
    }
    
    func getArticle(from endpoint: Endpoint, completion: @escaping(Result<[Article], Error>) -> Void) {
        guard let url = endpoint.absoluteURL else { return }
        performRequest(with: url) { result in
            print()
            switch result {
            case .success(let newsResponse):
                completion(.success(newsResponse.articles ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSource(from endpoint: Endpoint, completion: @escaping(Result<[Source], Error>) -> Void) {
        guard let url = endpoint.absoluteURL else { return }
        performRequest(with: url) { result in
            switch result {
            case .success(let newsResponse):
                completion(.success(newsResponse.sources ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }    
}
